import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/register.dart';

dynamic createAccount(Register register) async {
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["razaoSocial"] = register.razaoSocial;
  payload["cnpj"] = register.documento;
  payload["responsavel"] = register.responsavel;
  payload["responsavelEmail"] = register.responsavelEmail;
  payload["senha"] = register.senha;

  try {
    var response = await client.post(
        'https://ecommercebank.tk/ecommerce/api/Estabelecimento/onboarding',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(payload));

    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  } finally {
    client.close();
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
