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
  payload["token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogSW5kZXplaWNoYWtcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6XCJDbG91ZENSTVwiLFwiUmF6YW9Tb2NpYWxFc3RhYmVsZWNpbWVudG9cIjpcIkNMT1VEQ1JNIFNJU1RFTUFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJQZXJtaXNzb2VzXCI6XCJNT0RVTE9fR0VSQUxcIn0iLCJ1bmlxdWVfbmFtZSI6Ikx1aXogSW5kZXplaWNoYWsiLCJlbWFpbCI6Imx1aXpAY2xvdWRjcm0udGVjaCIsInJvbGUiOiJNT0RVTE9fR0VSQUwiLCJuYmYiOjE2MDc5NTIwMDQsImV4cCI6MTYwNzk4MDgwNCwiaWF0IjoxNjA3OTUyMDA0LCJpc3MiOiJFY29tbWVyY2VCYW5rIn0.lcz0Ozk-UM5K-ICWdfkUP8wvXislZh4t9PA0b7nQho0";

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
