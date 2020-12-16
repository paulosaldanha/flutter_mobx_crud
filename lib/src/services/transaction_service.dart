import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

dynamic createTransaction(Map<String,String> payload) async {
  var client = http.Client();

  try {
    var response = await client.post(
      'https://api.pagar.me/1/transactions',
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: jsonEncode(payload)
    );

    return jsonDecode(response.body);
  }
  finally {
    client.close();
  } 
  
}
dynamic getTax(String current, int method) async {
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["valor"] = double.parse(current);
  payload["metodo"] = method;
  payload["token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogSW5kZXplaWNoYWtcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6XCJDbG91ZENSTVwiLFwiUmF6YW9Tb2NpYWxFc3RhYmVsZWNpbWVudG9cIjpcIkNMT1VEQ1JNIFNJU1RFTUFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJOaXZlbEFjZXNzb1wiOlwiU0FETUlOXCJ9IiwidW5pcXVlX25hbWUiOiJMdWl6IEluZGV6ZWljaGFrIiwiZW1haWwiOiJsdWl6QGNsb3VkY3JtLnRlY2giLCJyb2xlIjoiU0FETUlOIiwibmJmIjoxNjA4MTQ2NTk3LCJleHAiOjE2MDgxNzUzOTcsImlhdCI6MTYwODE0NjU5NywiaXNzIjoiRWNvbW1lcmNlQmFuayJ9.bGWudoDF6CczK05_fdW7JmR_VtGJflLb3VcBoQ-qVbk";

  try {
    var response = await client.post(
        'http://ecommercebank.tk/ecommerce/api/Transacao/calculo',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(payload)
    );

    return jsonDecode(response.body);
  }
  finally {
    client.close();
  }

}
