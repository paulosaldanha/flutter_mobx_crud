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
dynamic getTaxa(String current, int method) async {
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["valor"] = double.parse(current);
  payload["metodo"] = method;
  payload["token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogVmxhZGltaXJcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6bnVsbCxcIlJhemFvU29jaWFsRXN0YWJlbGVjaW1lbnRvXCI6XCJDTE9VRENSTSBTSVNURU1BU1wiLFwiUmVwYXNzZVRheGFDbGllbnRlXCI6dHJ1ZSxcIk5pdmVsQWNlc3NvXCI6XCJTQURNSU5cIn0iLCJ1bmlxdWVfbmFtZSI6Ikx1aXogVmxhZGltaXIiLCJlbWFpbCI6Imx1aXpAY2xvdWRjcm0udGVjaCIsInJvbGUiOiJTQURNSU4iLCJuYmYiOjE2MDc2ODc4OTUsImV4cCI6MTYwNzcxNjY5NSwiaWF0IjoxNjA3Njg3ODk1LCJpc3MiOiJFY29tbWVyY2VCYW5rIn0.QQk3ss_ZWZ6ATBvmuTJ_S3irLfEVNAu_5gG3EkgYSmA";
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
