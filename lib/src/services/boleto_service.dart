import 'dart:convert';
import 'dart:io';
import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/boleto.dart';

class BoletoService {
  dynamic createTransactionBoleto(Boleto boleto) async {
     String barer_token = await AuthService().checkIfUserIsLoggedIn(); 
    var client = http.Client();

    Map<String, Object> payload = Map();
    payload["nome"] = boleto.name;
    payload["documento"] = boleto.document;
    payload["ddd"] = boleto.ddd;
    payload["telefone"] = boleto.telephone;
    payload["mensagem"] = boleto.message;
    payload["vencimento"] = boleto.dateExpiration;

    try {
      var response = await client.post(
          'http://ecommercebank.tk/ecommerce/api/Transacao/boleto',
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer ${barer_token}'
          },
          body: jsonEncode(payload));

      return jsonDecode(response.body);
    } finally {
      client.close();
    }
  }
}
