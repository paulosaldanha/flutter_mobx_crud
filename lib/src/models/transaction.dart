import 'package:estruturabasica/src/models/pais.dart';
import 'package:estruturabasica/src/util/status_transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'transaction.g.dart';

// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class Transaction = _TransactionBase with _$Transaction;

//Store sinaliza que a classe esta apta a geração de codigo automatica do mobx
abstract class _TransactionBase with Store {
  @observable
  int id;
  @observable
  String amount;
  @observable
  String idTransaction;
  @observable
  String name;
  @observable
  String document;
  @observable
  int installments;
  @observable
  String status;

  @action
  setName(String value) => name = value;

  @action
  setAmount(String value) => amount = value;

  @action
  setIdTransaction(String value) => idTransaction = value;

  @action
  setdocument(String value) => document = value;

  @action
  setInstallments(String value) => installments = int.parse(value);

  @action
  setStatus(String value) => status = value;

  _TransactionBase.construtorParametro(this.id, this.name, this.amount,
      this.document, this.installments, this.idTransaction, this.status);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'amount': amount,
      'document': document,
      'installments': installments,
      'idTransaction': idTransaction,
      'status': status
    };
    return map;
  }

  _TransactionBase.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['nomeCliente'];
    amount = map['valor'].toStringAsFixed(2).replaceAll('.', ',');
    document = map['documento'];
    installments = map['parcelas'];
    idTransaction = map['nossoNumero'];
    status = StatusTransaction.getStatusTransaction(map['statusTransacao']);
  }
}

