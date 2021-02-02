import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/dto/transaction_boleto_dto.dart';
import 'package:estruturabasica/src/dto/transaction_link_dto.dart';
import 'package:estruturabasica/src/dto/transaction_wallet_dto.dart';
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

  Future<TransactionWalletDto> getWalletValue() async {
    try {
      var response = await dio.post('/home/painel', data: '');
      return TransactionWalletDto.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionBoletoDto> createTransactionBoleto(Boleto boleto) async {
    try {
      var response = await dio.post('/Transacao/boleto',
          data: TransactionBoletoDto.fromMapBolete(boleto).toJson());
      return TransactionBoletoDto.fromMap(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<TransactionLinkDto> createTransactionLink(TransactionLink link) async {
    try {
      var response = await dio.post('/TransacaoLink',
          data: TransactionLinkDto.fromMapLink(link).toJson());
      return TransactionLinkDto.fromMap(response.data);
    } catch (e) {
      print(e);
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
      var response =
          await dio.post('/Transacao/calculo', data: jsonEncode(payload));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  dynamic getBoleto(String nossoNumero) async {
    try {
      var response = await dio.get('/transacao/boleto/$nossoNumero');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
