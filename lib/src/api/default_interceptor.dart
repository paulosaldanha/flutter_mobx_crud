import 'package:dio/dio.dart';
import 'package:ecommerceBankPay/src/api/token/token_store.dart';

class DefaultInterceptor implements Interceptor {
  final TokenStore _tokenStore;

  DefaultInterceptor(this._tokenStore);

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    final blackList = ["/usuario/login"];
    final relative = options.path;
    final containsPath = blackList.any((e) => e == relative);
    if (!containsPath) {
      final token = await _tokenStore.read();
      return options..headers["Authorization"] = "Bearer $token";
    }
    return options;
  }

  @override
  Future onResponse(Response response) async {
    if (response.request.path == "/usuario/login") {
      final token = response.data["accessToken"];
      await _tokenStore.save(token);
    }
    return response;
  }

  @override
  Future onError(DioError err) async {
    return err;
  }
}