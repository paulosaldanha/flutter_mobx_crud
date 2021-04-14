import 'package:cloud_crm/src/api/token/token_store.dart';
import 'package:dio/dio.dart';

class DefaultInterceptor implements Interceptor {
  final TokenStore _tokenStore;

  DefaultInterceptor(this._tokenStore);

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    print('fetching data');
    final blackList = ["/login"];
    final relative = options.path;
    final containsPath = blackList.any((e) => e == relative);
    if (!containsPath) {
      final token = await _tokenStore.read();
      return options..headers["Authorization"] = "Bearer $token";
      //return options..headers["Authorization"] = token;
    }
    return options;
  }

  @override
  Future onResponse(Response response) async {
    if (response.request.path == "/login") {
      final token = response.data["token"];
      await _tokenStore.save(token);
    }
    return response;
  }

  @override
  Future onError(DioError err) async {
    return err;
  }
}