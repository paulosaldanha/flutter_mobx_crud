import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:estruturabasica/src/models/transaction_online.dart';

class TransactionOnlineService {
  final Dio dio;
  TransactionOnlineService(this.dio);

  dynamic createTransactionOnline(TransactionOnline trasactiononline) async {

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
      var response = await dio.post(
          '/Transacao/cartao',
          data: jsonEncode(payload));
     return response.data;

      // if (response.statusCode == 400) {
      //   res['errors'].forEach((f) {
      //     print(f['field']);
      //     print(f['errorDescription']);
      //   });
      //   return res;
      // }
      // if (response.statusCode == 422) {
      //   return res;
      // }
    } catch (e) {
      rethrow;
    }
  }
}
