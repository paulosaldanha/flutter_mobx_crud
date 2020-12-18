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
          },
          body: jsonEncode(payload));

      var tes = jsonDecode(response.body);
     if(response.statusCode == 200){
       return tes;
     }
     if(response.statusCode == 400){
       return  tes;
     }
      if(response.statusCode == 422){
        return tes;
      }

    } catch(e){
      print(e);
    }finally {
      client.close();
    }
  }
}
