import 'dart:convert';
import 'dart:io';

import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionOnlineService {
  dynamic createTransactionOnline(TransactionOnline trasactiononline) async {
     String barer_token = await AuthService().checkIfUserIsLoggedIn(); 

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
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return res;
      }
      if (response.statusCode == 401) {
        return await AuthService.logout();
      }
      if (response.statusCode == 400) {
          res['errors'].forEach((f) {
            print (f['field']);
            print (f['errorDescription']);
          }
          );
        return res;
      }
      if (response.statusCode == 422) {
        return res;
      }
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }
}
