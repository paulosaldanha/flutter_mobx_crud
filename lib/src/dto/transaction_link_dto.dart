import 'dart:convert';

import 'package:estruturabasica/src/models/transaction_link.dart';

class TransactionLinkDto {
  String nome;
  double valor;
  String dataExpiracao;
  String quantidadeDeParcelaMaxima;
  String linkId;
  int statusOperation;

  TransactionLinkDto.fromMapLink(TransactionLink link) {
    nome = link.name;
    valor = link.value;
    quantidadeDeParcelaMaxima = link.installments;
    dataExpiracao = link.dateExpiration.toString();
  }

  TransactionLinkDto.fromMap(Map<String, dynamic> map){
    nome = map['nome']??"";
    valor = map['valor']??"";
    quantidadeDeParcelaMaxima = map['quantidadeDeParcelaMaxima'].toString()??"";
    linkId = map['linkId']??"";
    dataExpiracao = map['dataExpiracao']??"";
    statusOperation = map['status']??"";
  }

  dynamic toJson() {
    Map<String, Object> payload = Map();
    payload["nome"] = nome;
    payload["valor"] = valor;
    payload["quantidadeDeParcelaMaxima"] = quantidadeDeParcelaMaxima;
    payload["dataExpiracao"] = dataExpiracao;
    return jsonEncode(payload);
  }




}
