import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionOnlineService {
  dynamic createTransactionOnline(TransactionOnline trasactiononline) async {
    SharedPreferences _sharedPrefs;
 
    _sharedPrefs = await SharedPreferences.getInstance();
    String barer_token = _sharedPrefs.getString('jwt') ?? "";
    print(barer_token);

    var client = http.Client();

    Map<String, Object> payload = Map();
    payload["nome"] = trasactiononline.name;
    payload["email"] = trasactiononline.email;
    payload["documento"] = trasactiononline.document;
    payload["ddd"] = trasactiononline.ddd;
    payload["telefone"] = trasactiononline.telephone;
    payload["dataExpiracaoCartao"] = trasactiononline.cardDateExpiration;
    payload["parcelas"] = trasactiononline.installments;
    payload["numeroCartao"] = trasactiononline.cardNumber;
    payload["nomeCartao"] = trasactiononline.cardName;
    payload["cvvCartao"] = trasactiononline.cardCVV;
    payload["valor"] = trasactiononline.value;

    try {
      var response = await client.post(
          'http://ecommercebank.tk/ecommerce/api/Transacao/cartao',
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer ${barer_token}'
                //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY3RvcnQiOiJ7XCJVc3VhcmlvSWRcIjoxLFwiTm9tZVVzdWFyaW9cIjpcIkx1aXogSW5kZXplaWNoYWtcIixcIkVtYWlsVXN1YXJpb1wiOlwibHVpekBjbG91ZGNybS50ZWNoXCIsXCJFc3RhYmVsZWNpbWVudG9JZFwiOjEsXCJOb21lRXN0YWJlbGVjaW1lbnRvXCI6XCJDbG91ZENSTVwiLFwiUmF6YW9Tb2NpYWxFc3RhYmVsZWNpbWVudG9cIjpcIkNMT1VEQ1JNIFNJU1RFTUFcIixcIlJlcGFzc2VUYXhhQ2xpZW50ZVwiOnRydWUsXCJOaXZlbEFjZXNzb1wiOlwiU0FETUlOXCJ9IiwidW5pcXVlX25hbWUiOiJMdWl6IEluZGV6ZWljaGFrIiwiZW1haWwiOiJsdWl6QGNsb3VkY3JtLnRlY2giLCJyb2xlIjoiU0FETUlOIiwibmJmIjoxNjA4MTQ2NTk3LCJleHAiOjE2MDgxNzUzOTcsImlhdCI6MTYwODE0NjU5NywiaXNzIjoiRWNvbW1lcmNlQmFuayJ9.bGWudoDF6CczK05_fdW7JmR_VtGJflLb3VcBoQ-qVbk'
          },
          body: jsonEncode(payload));

      return jsonDecode(response.body);
    } catch(e){
      print(e);
    }finally {
      client.close();
    }
  }
}
