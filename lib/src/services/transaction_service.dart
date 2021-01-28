import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';

class TransactionService {
  final Dio dio;

  TransactionService(this.dio);

  dynamic createTransaction(Map<String, String> payload) async {
    var client = http.Client();

    try {
      var response = await client.post('https://api.pagar.me/1/transactions',
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

  dynamic getWalletValue() async {
    try {
      var response =
          await dio.post('/home/painel', data:'');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  dynamic createTransactionBoleto(Boleto boleto) async {

    Map<String, Object> payload = Map();
    payload["nome"] = boleto.name;
    payload["documento"] = boleto.document;
    payload["ddd"] = boleto.ddd;
    payload["telefone"] = boleto.telephone;
    payload["valor"] = boleto.value;
    payload["vencimento"] = boleto.dateExpiration.toString();
    payload["mensagem"] = boleto.message;

    try {
      var response = await  dio.post(
          '/Transacao/boleto',
          data: jsonEncode(payload));
      return response.data;
    } catch (e) {
      rethrow;
    }

  }

  dynamic createTransactionLink(TransactionLink link) async {

    Map<String, Object> payload = Map();
    payload["nome"] = link.name;
    payload["valor"] = link.value;
    payload["quantidadeDeParcelaMaxima"] = link.installments;
    payload["dataExpiracao"] = link.dateExpiration.toString();

    try {
      var response = await  dio.post(
          'TransacaoLink',
         data: jsonEncode(payload));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  dynamic getTax(String current, int method) async {
    String bearerToken = await AuthService(Api()).checkIfUserIsLoggedIn();

    Map<String, Object> payload = Map();
    payload["valor"] = double.parse(current);
    payload["metodo"] = method;
    payload["token"] = bearerToken;

    try {
      var response = await dio.post(
          '/Transacao/calculo',
          data: jsonEncode(payload));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  dynamic getBoleto(String nossoNumero) async {
    try {
      var response = await dio.get('/transacao/boleto/$nossoNumero');
      return response.data;
    } catch(e){
      rethrow;
    }
  }
}
