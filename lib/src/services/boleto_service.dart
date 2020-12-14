import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/boleto.dart';

class BoletoService {
  dynamic createTransactionBoleto(Boleto boleto) async {
    var client = http.Client();

    Map<String, Object> payload = Map();
    payload["nome"] = boleto.name;
    payload["email"] = boleto.email;
    payload["documento"] = boleto.document;
    payload["ddd"] = boleto.ddd;
    payload["telefone"] = boleto.telephone;
    payload["mensagem"] = boleto.message;
    payload["vencimento"] = boleto.dateExpiration;
    payload["token"] =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogVmxhZGltaXJcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6bnVsbCxcIlJhemFvU29jaWFsRXN0YWJlbGVjaW1lbnRvXCI6XCJDTE9VRENSTSBTSVNURU1BU1wiLFwiUmVwYXNzZVRheGFDbGllbnRlXCI6dHJ1ZSxcIk5pdmVsQWNlc3NvXCI6XCJTQURNSU5cIn0iLCJ1bmlxdWVfbmFtZSI6Ikx1aXogVmxhZGltaXIiLCJlbWFpbCI6Imx1aXpAY2xvdWRjcm0udGVjaCIsInJvbGUiOiJTQURNSU4iLCJuYmYiOjE2MDc2MDcwODcsImV4cCI6MTYwNzYzNTg4NywiaWF0IjoxNjA3NjA3MDg3LCJpc3MiOiJFY29tbWVyY2VCYW5rIn0.fQWFUunH775AGHig7u8eC4rGL3MP3KVBQ7kPATAfHSA";

    try {
      var response = await client.post(
          'http://ecommercebank.tk/ecommerce/api/Transacao/boleto',
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
}
