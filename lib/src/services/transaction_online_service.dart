import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:estruturabasica/src/dto/transaction_online_dto.dart';
import 'package:estruturabasica/src/models/transaction_online.dart';

class TransactionOnlineService {
  final Dio dio;
  TransactionOnlineService(this.dio);

  Future<TransactionOnlineDto> createTransactionOnline(TransactionOnline trasactiononline) async {
    try {
      var response = await dio.post(
          '/Transacao/cartao',
          data:TransactionOnlineDto.fromMapOnline(trasactiononline).toJson());
     return TransactionOnlineDto.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
