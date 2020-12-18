import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';

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
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["nome"] = boleto.name;
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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogSW5kZXplaWNoYWtcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6XCJDbG91ZENSTVwiLFwiUmF6YW9Tb2NpYWxFc3RhYmVsZWNpbWVudG9cIjpcIkNMT1VEQ1JNIFNJU1RFTUFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJOaXZlbEFjZXNzb1wiOlwiU0FETUlOXCJ9IiwidW5pcXVlX25hbWUiOiJMdWl6IEluZGV6ZWljaGFrIiwiZW1haWwiOiJsdWl6QGNsb3VkY3JtLnRlY2giLCJyb2xlIjoiU0FETUlOIiwibmJmIjoxNjA4MjIyODg4LCJleHAiOjE2MDgyNTE2ODgsImlhdCI6MTYwODIyMjg4OCwiaXNzIjoiRWNvbW1lcmNlQmFuayJ9.3D3U1g2JrXh8VqnBU-DYJdQ4g7i5EeTz-0d4Ldp6lqQ'
        },
        body: jsonEncode(payload));

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}

dynamic createTransactionLink(TransactionLink link) async {
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
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogSW5kZXplaWNoYWtcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6XCJDbG91ZENSTVwiLFwiUmF6YW9Tb2NpYWxFc3RhYmVsZWNpbWVudG9cIjpcIkNMT1VEQ1JNIFNJU1RFTUFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJOaXZlbEFjZXNzb1wiOlwiU0FETUlOXCJ9IiwidW5pcXVlX25hbWUiOiJMdWl6IEluZGV6ZWljaGFrIiwiZW1haWwiOiJsdWl6QGNsb3VkY3JtLnRlY2giLCJyb2xlIjoiU0FETUlOIiwibmJmIjoxNjA4MjIyODg4LCJleHAiOjE2MDgyNTE2ODgsImlhdCI6MTYwODIyMjg4OCwiaXNzIjoiRWNvbW1lcmNlQmFuayJ9.3D3U1g2JrXh8VqnBU-DYJdQ4g7i5EeTz-0d4Ldp6lqQ'

            },
            body: jsonEncode(payload));

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}

dynamic getTax(String current, int method) async {
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["valor"] = double.parse(current);
  payload["metodo"] = method;
  payload["token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogSW5kZXplaWNoYWtcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6XCJDbG91ZENSTVwiLFwiUmF6YW9Tb2NpYWxFc3RhYmVsZWNpbWVudG9cIjpcIkNMT1VEQ1JNIFNJU1RFTUFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJOaXZlbEFjZXNzb1wiOlwiU0FETUlOXCJ9IiwidW5pcXVlX25hbWUiOiJMdWl6IEluZGV6ZWljaGFrIiwiZW1haWwiOiJsdWl6QGNsb3VkY3JtLnRlY2giLCJyb2xlIjoiU0FETUlOIiwibmJmIjoxNjA4MjIyODg4LCJleHAiOjE2MDgyNTE2ODgsImlhdCI6MTYwODIyMjg4OCwiaXNzIjoiRWNvbW1lcmNlQmFuayJ9.3D3U1g2JrXh8VqnBU-DYJdQ4g7i5EeTz-0d4Ldp6lqQ";
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
