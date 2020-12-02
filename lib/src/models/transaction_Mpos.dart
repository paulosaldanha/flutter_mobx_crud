import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'transaction_Mpos.g.dart';

class TransactionMpos = _TransactionMposBase with _$TransactionMpos;
abstract class _TransactionMposBase with Store {


  int id;
  @observable
  String deviceName;
  @observable
  String paymentMethod;
  @observable
  int installments;
  @observable
  int amount;
  @observable
  String currentValues = "0.00";
  @observable
  List currentValuesList = List();



  @action
  setDeviceName(String value) => deviceName = value;

  @action
  setPaymentMethod(String value) => paymentMethod = value;

  @action
  setInstallments(String value) => installments = int.parse(value);

  @action
  setAmount(String value) => amount = int.parse(value);

  @action
  setCurrentValues(String value) {
    if(value == "clear"){
      if(currentValuesList.length == 0){
        return currentValues = "0.00";
      }
      currentValuesList.removeLast();
      return currentValues = convertToString(currentValuesList);
    }
      currentValuesList.add(value);
      return currentValues = convertToString(currentValuesList);
  }

  String convertToString(List values) {
    String val = '';
    for (int i = 0;i < values.length;i++) {
      val+=values[i];
    }
    double realCurrent = int.parse(val)/100;
    return realCurrent.toStringAsFixed(2);
  }
//Constructors
  _TransactionMposBase.construtorParametro (this.deviceName, this.paymentMethod, this.installments, this.amount);

  _TransactionMposBase ();




//List Functions
  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'id': id,
      'deviceName': deviceName,
      'paymentMethod': paymentMethod,
      'installments': installments,
      'amount': amount,
    };
    return map;
  }

  _TransactionMposBase.fromMap(Map<String,dynamic> map){
    id = map['id'];
    deviceName = map['deviceName'];
    paymentMethod = map['paymentMethod'];
    installments = map['installments'];
    amount = map['amount'];
  }
}