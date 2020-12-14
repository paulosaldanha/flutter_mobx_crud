import 'package:estruturabasica/src/controllers/transaction/transaction_modal_controller.dart';
import 'package:estruturabasica/src/models/taxa.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/util/device_service.dart';
import 'package:estruturabasica/src/util/taxa_method_payment_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';

part 'transaction_mpos_controller.g.dart';

class TransactionMposController = _TransactionMposController with _$TransactionMposController;

abstract class _TransactionMposController with Store {

  TransactionMpos transactionMpos = TransactionMpos();

  _TransactionMposController();

  @observable
  String currentValues = "0,00";
  @observable
  List currentValuesList = List();
  @observable
  bool visibilityModalblueth = false;


  @action
  setCurrentValues(String value) {
    if (value == "clear") {
      if (currentValuesList.length == 0) {
        return currentValues = "0,00";
      }
      currentValuesList.removeLast();
      return currentValues =
          TaxaMethodPaymentService.convertToString(currentValuesList);
    }
    if (!(currentValuesList.length == 7)) {
      currentValuesList.add(value);
    }
    return currentValues =
        TaxaMethodPaymentService.convertToString(currentValuesList);
  }

  @action
  void setDeviceName(String value) {
    transactionMpos.setDeviceName(value);
  }

  @action
  setInstallments(int value) => transactionMpos.installments = value;

  @action
  setAmount(int value) => transactionMpos.amount = value;


  @action
  setvisibilityModalblueth(bool value) => visibilityModalblueth = value;

  @action
  bool deviceIsempty(){
    if( transactionMpos.deviceName != null){
      return true;
    }else{
      return false;
    }
  }

  @action
  void setPaymentMethod(String value){
    if (value == 'credito') {
      transactionMpos.setPaymentMethod( PaymentMethod.CreditCard);
    }
    if (value == 'debito') {
      transactionMpos.setPaymentMethod( PaymentMethod.DebitCard);
    }
  }

  Future<void> initPlatformState(TransactionModalController transactionMposController, context) async {
    transactionMposController.setImgStatus('images/pay.png');
    transactionMposController.setStatus(1);
    DeviceService device =  await DeviceService(
        deviceName: transactionMpos.deviceName,
        amount: transactionMpos.amount,
        installments: transactionMpos.installments,
        paymentMethod: transactionMpos.paymentMethod,
        status: transactionMposController,
        context: context
    );
  }

}