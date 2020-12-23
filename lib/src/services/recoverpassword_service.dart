import 'dart:convert';
import 'package:estruturabasica/src/models/recoverpassword.dart';
import 'package:http/http.dart' as http;

class RecoverPasswordService {
  String baseUrl = 'https://ecommercebank.tk/ecommerce/api/Usuario/recoverpassword';

  Future<RecoverPasswordResponseModel> recoverpassword(RecoverPasswordModel requestModel) async {
    final res = await http.post(baseUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestModel.toJson()));
    if (res.statusCode == 200 || res.statusCode == 400) {
      return RecoverPasswordResponseModel.fromJson(json.decode(res.body));
    } else {
      return RecoverPasswordResponseModel.fromJson(json.decode(res.body));
    }
  }
}
