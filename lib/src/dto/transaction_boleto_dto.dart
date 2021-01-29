import 'dart:convert';

import 'package:estruturabasica/src/models/boleto.dart';

class TransactionBoletoDto {
  String nome;
  String documento;
  String ddd;
  String telefone;
  double valor;
  String vencimento;
  String mensagem;

  TransactionBoletoDto.fromMapBolete(Boleto boleto) {
    nome = boleto.name;
    documento = boleto.document;
    ddd = boleto.ddd;
    telefone = boleto.telephone;
    valor = boleto.value;
    vencimento = boleto.dateExpiration.toString();
    mensagem = boleto.message;
  }

  dynamic toJson() {
    Map<String, Object> payload = Map();
    payload["nome"] = nome;
    payload["documento"] = documento;
    payload["ddd"] = ddd;
    payload["telefone"] = telefone;
    payload["valor"] = valor;
    payload["vencimento"] = vencimento.toString();
    payload["mensagem"] = mensagem;
    return jsonEncode(payload);
  }




}
