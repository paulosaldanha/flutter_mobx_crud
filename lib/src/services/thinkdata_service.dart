import 'package:dio/dio.dart';
import 'package:estruturabasica/src/models/user_thinkdata.dart';

class ThinkDataService {
  final Dio dio;
  ThinkDataService(this.dio);

  Future<UserThinkdata> getUserThinkData(String documento) async {
    documento = documento.replaceAll("\/", "");
    try {
      var response = await dio.get(
          '/thinkdata/$documento');
      return UserThinkdata.fromMap(response.data);
    }catch(e){
      rethrow;
    }
  }
}
