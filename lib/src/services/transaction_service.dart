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
  payload["documento"] = boleto.document;
  payload["ddd"] = boleto.ddd;
  payload["telefone"] = boleto.telephone;
  payload["valor"] = boleto.value;
  payload["vencimento"] = boleto.dateExpiration.toString();
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
  } catch (e) {
    print(e);
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
  payload["dataExpiracao"] = link.dateExpiration.toString();

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
  } catch (e) {
    print(e);
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

dynamic getBoleto(String nossoNumero) async {
  var client = http.Client();

  try {
    var response = await client.get(
        'http://ecommercebank.tk/ecommerce/api/transacao/boleto/${nossoNumero}',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogSW5kZXplaWNoYWtcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6XCJDbG91ZENSTVwiLFwiUmF6YW9Tb2NpYWxFc3RhYmVsZWNpbWVudG9cIjpcIkNMT1VEQ1JNIFNJU1RFTUFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJQZXJtaXNzb2VzXCI6W1wiTU9EVUxPX0dFUkFMXCJdLFwiU3Vib3JkaW5hZG9zXCI6bnVsbH0iLCJ1bmlxdWVfbmFtZSI6Ikx1aXogSW5kZXplaWNoYWsiLCJlbWFpbCI6Imx1aXpAY2xvdWRjcm0udGVjaCIsInJvbGUiOiJNT0RVTE9fR0VSQUwiLCJuYmYiOjE2MDg3Mjc4MjcsImV4cCI6MTYwODc1NjYyNywiaWF0IjoxNjA4NzI3ODI3LCJpc3MiOiJFY29tbWVyY2VCYW5rIn0.dGIfkhzvBaYW7aaoYryOEpODXGi62QYferd0M9Q07I0'
        });

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}
