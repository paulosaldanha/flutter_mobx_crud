import 'dart:convert';
import 'dart:io';
import 'package:estruturabasica/src/services/auth_service.dart';
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

    if (response.statusCode == 401) {
      return await AuthService.logout();
    }
    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}

dynamic getWalletValue() async {
  String bearerToken = await AuthService().checkIfUserIsLoggedIn();
  var client = http.Client();
  try {
    var response =
        await client.post('http://ecommercebank.tk/ecommerce/api/home/painel',
            headers: {
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
            },
            body: '');

    if (response.statusCode == 401) {
      return await AuthService.logout();
    }
    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
}

dynamic createTransactionBoleto(Boleto boleto) async {
  String bearerToken = await AuthService().checkIfUserIsLoggedIn();
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["nome"] = boleto.name;
  payload["documento"] = boleto.document;
  payload["ddd"] = boleto.ddd;
  payload["telefone"] = boleto.telephone;
  payload["valor"] = boleto.value;
  payload["vencimento"] = boleto.dateExpiration.toString();
  payload["mensagem"] = boleto.message;

  try {
    var response = await client.post(
        'http://ecommercebank.tk/ecommerce/api/Transacao/boleto',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
        },
        body: jsonEncode(payload));

    if (response.statusCode == 401) {
      return await AuthService.logout();
    }

    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
}

dynamic createTransactionLink(TransactionLink link) async {
  String bearerToken = await AuthService().checkIfUserIsLoggedIn();
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["nome"] = link.name;
  payload["valor"] = link.value;
  payload["quantidadeDeParcelaMaxima"] = link.installments;
  payload["dataExpiracao"] = link.dateExpiration.toString();

  try {
    var response =
        await client.post('http://ecommercebank.tk/ecommerce/api/TransacaoLink',
            headers: {
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
            },
            body: jsonEncode(payload));

    if (response.statusCode == 401) {
      return await AuthService.logout();
    }

    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
}

dynamic getTax(String current, int method) async {
  String bearerToken = await AuthService().checkIfUserIsLoggedIn();
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["valor"] = double.parse(current);
  payload["metodo"] = method;
  payload["token"] = bearerToken;

  try {
    var response = await client.post(
        'http://ecommercebank.tk/ecommerce/api/Transacao/calculo',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(payload));

    if (response.statusCode == 401) {
      return await AuthService.logout();
    }

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}

dynamic getBoleto(String nossoNumero) async {
  String bearerToken = await AuthService().checkIfUserIsLoggedIn();
  var client = http.Client();

  try {
    var response = await client.get(
        'http://ecommercebank.tk/ecommerce/api/transacao/boleto/$nossoNumero',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
        });

    if (response.statusCode == 401) {
      return await AuthService.logout();
    }

    return jsonDecode(response.body);
  } finally {
    client.close();
  }
}
