import 'dart:convert';

import 'package:ecommerceBankPay/src/models/boleto.dart';

class TransactionBoletoDto {
  String nome;
  String documento;
  String ddd;
  String telefone;
  double valor;
  String vencimento;
  String mensagem;
  String nossoNumero;
  String linhaDigitavel;
  String codigoDeBarra;
  String parcela;
  String link;


  TransactionBoletoDto.fromMapBolete(Boleto boleto) {
    nome = boleto.name;
    documento = boleto.document;
    ddd = boleto.ddd;
    telefone = boleto.telephone;
    valor = boleto.value;
    vencimento = boleto.dateExpiration.toString();
    mensagem = boleto.message;
  }

  TransactionBoletoDto.fromMap(Map<String, dynamic> map){
     nome = map['nomeCliente']??"";
     documento = map['documento']??"";
     valor = map['valor']??"";
     nossoNumero = map['nossoNumero']??"";
     linhaDigitavel = map['linhaDigitavel']??"";
     codigoDeBarra = map['codigoDeBarra']??"";
     parcela = map['parcelas'].toString()??"";
     link = map['transacaoLinkId']??"";
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
