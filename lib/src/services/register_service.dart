import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerceBankPay/src/models/register.dart';

class RegisterService {

  final Dio dio;
  RegisterService(this.dio);

  dynamic createAccount(Register register) async {

    Map<String, Object> payload = Map();
    payload["razaoSocial"] = register.razaoSocial;
    payload["cnpj"] = register.documento;
    payload["responsavel"] = register.responsavel;
    payload["responsavelEmail"] = register.responsavelEmail;
    payload["senha"] = register.senha;

    try {
      var response = await dio.post(
          '/Estabelecimento/onboarding',
          data: json.encode(payload));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  dynamic valideRUC(String document) async {
    var client = http.Client();

    Map<String, Object> payload = Map();
    payload["buscar"] = document;

    try {
      var response = await client.post(
          'https://www.ruc.com.py/index.php/inicio/consulta_ruc',
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: payload);

      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }

  dynamic recoverPassword(email) async {

    Map<String, Object> payload = Map();
    payload["email"] = email;

    try {
      var response = await dio.post(
          '/Usuario/recoverpassword',
          data: json.encode(payload));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
