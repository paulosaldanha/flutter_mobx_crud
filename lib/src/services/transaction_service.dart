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
dynamic getTaxa(String current) async {
  var client = http.Client();

  try {
    var response = await client.get(
        'http://ecommercebank.tk/ecommerce/api/Transacao/calculocartao/${current}',
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcInJuYWxkbyBkYSBzaWx2YVwiLFwiRW1haWxVc3VhcmlvXCI6XCJkZXNlbnZvbHZpbWVudG9AY2xvdWRjcm0udGVjaFwiLFwiRXN0YWJlbGVjaW1lbnRvSWRcIjoxLFwiTm9tZUVzdGFiZWxlY2ltZW50b1wiOm51bGwsXCJSYXphb1NvY2lhbEVzdGFiZWxlY2ltZW50b1wiOlwiQkFSIEUgTUVSQ0VBUklBIE1JTkhPQ0FPIExUREFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJOaXZlbEFjZXNzb1wiOlwiU0FETUlOXCJ9IiwidW5pcXVlX25hbWUiOiJybmFsZG8gZGEgc2lsdmEiLCJlbWFpbCI6ImRlc2Vudm9sdmltZW50b0BjbG91ZGNybS50ZWNoIiwicm9sZSI6IlNBRE1JTiIsIm5iZiI6MTYwNzQyODMyMywiZXhwIjoxNjA3NDU3MTIzLCJpYXQiOjE2MDc0MjgzMjMsImlzcyI6IkVjb21tZXJjZUJhbmsifQ.DcGJJDbXQOF7Oz2XEbmCufDhJd5jFgnNcfeZxqyo5kY'
        }
    );

    return jsonDecode(response.body);
  }
  finally {
    client.close();
  }

}
