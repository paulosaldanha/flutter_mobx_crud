import 'dart:convert';

import 'package:estruturabasica/src/models/transaction_online.dart';

class TransactionOnlineDto{

  String nome;
  String email;
  String documento;
  String ddd;
  String telefone;
  String dataExpiracaoCartao;
  int parcelas;
  String numeroCartao;
  String cvvCartao;
  String nomeCartao;
  double valor;
  int statusTransacao;
  String nossoNumero;


  TransactionOnlineDto.fromMapOnline(TransactionOnline transactionOnline) {
    nome = transactionOnline.name;
    email = transactionOnline.email;
    documento = transactionOnline.document;
    ddd = transactionOnline.ddd;
    telefone = transactionOnline.telephone;
    dataExpiracaoCartao = transactionOnline.cardDateExpiration.replaceAll("/", "");
    parcelas = transactionOnline.installments;
    numeroCartao = transactionOnline.cardNumber.replaceAll(" ", "");
    nomeCartao = transactionOnline.cardName;
    cvvCartao = transactionOnline.cardCVV;
    valor = transactionOnline.value;
  }

  TransactionOnlineDto.fromMap(Map<String, dynamic> map){
    nome = map['nomeCliente']??"";
    valor = map['valor']??"";
    documento = map['documento'].toString()??"";
    ddd = map['ddd']??"";
    telefone = map['telefone']??"";
    dataExpiracaoCartao = map['dataExpiracaoCartao']??"";
    parcelas = map['parcelas']??"";
    numeroCartao = map['numeroCartao']??"";
    nomeCartao = map['nomeCartao']??"";
    cvvCartao = map['cvvCartao']??"";
    statusTransacao = map['statusTransacao']??"";
    nossoNumero = map['nossoNumero']??"";
  }

  dynamic toJson() {
    Map<String, Object> payload = Map();
    payload["nome"] = nome;
    payload["email"] = email;
    payload["documento"] = documento;
    payload["ddd"] = ddd;
    payload["telefone"] = telefone;
    payload["dataExpiracaoCartao"] = dataExpiracaoCartao;
    payload["parcelas"] = parcelas;
    payload["numeroCartao"] = numeroCartao;
    payload["nomeCartao"] = nomeCartao;
    payload["cvvCartao"] = cvvCartao;
    payload["valor"] = valor;
    return jsonEncode(payload);
  }
}