import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic createTransaction(Map<String, String> payload) async {

  var client = http.Client();

  try {
    var response = await client.post('https://api.pagar.me/1/transactions',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(payload));

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}

dynamic createTransactionBoleto(Boleto boleto) async {
  SharedPreferences _sharedPrefs;
  _sharedPrefs = await SharedPreferences.getInstance();
  String barer_token = _sharedPrefs.getString('jwt') ?? "";

  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["nome"] = boleto.name;
  payload["email"] = boleto.email;
  payload["documento"] = boleto.document;
  payload["ddd"] = boleto.ddd;
  payload["telefone"] = boleto.telephone;
  payload["valor"] = boleto.value;
  payload["vencimento"] = boleto.dateExpiration;
  payload["mensagem"] = boleto.message;

  try {
    var response = await client.post(
        'http://ecommercebank.tk/ecommerce/api/Transacao/boleto',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${barer_token}'
        },
        body: jsonEncode(payload));

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}

dynamic createTransactionLink(TransactionLink link) async {
  SharedPreferences _sharedPrefs;
  _sharedPrefs = await SharedPreferences.getInstance();
  String barer_token = _sharedPrefs.getString('jwt') ?? "";
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["nome"] = link.name;
  payload["valor"] = link.value;
  payload["quantidadeDeParcelaMaxima"] = link.installments;
  payload["dataExpiracao"] = link.dateExpiration;

  try {
    var response =
        await client.post('http://ecommercebank.tk/ecommerce/api/TransacaoLink',
            headers: {
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader:
              'Bearer ${barer_token}'
            },
            body: jsonEncode(payload));

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}


dynamic getTax(String current, int method) async {
  SharedPreferences _sharedPrefs;
  _sharedPrefs = await SharedPreferences.getInstance();
  String barer_token = _sharedPrefs.getString('jwt') ?? "";
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["valor"] = double.parse(current);
  payload["metodo"] = method;
  payload["token"] = barer_token;

  try {
    var response = await client.post(
        'http://ecommercebank.tk/ecommerce/api/Transacao/calculo',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(payload));

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}
