import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/util/tax_method_payment_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';

part 'transaction_online_part2_controller.g.dart';

class TransactionOnlinePart2Controller = _TransactionOnlinePart2Controller with _$TransactionOnlinePart2Controller;

abstract class _TransactionOnlinePart2Controller with Store {
final transactiononline;

  _TransactionOnlinePart2Controller(this.transactiononline);

  @observable
  String currentValues = "0,00";
  @observable
  List currentValuesList = List();
  @observable
  bool visibilityModalBluetooth = false;


  @action
  setCurrentValues(String value) {
    if (value == "clear") {
      if (currentValuesList.length == 0) {
        return currentValues = "0,00";
      }
      currentValuesList.removeLast();
      return currentValues =
          TaxMethodPaymentService.convertToString(currentValuesList);
    }
    if (!(currentValuesList.length == 7)) {
      currentValuesList.add(value);
    }
    return currentValues =
        TaxMethodPaymentService.convertToString(currentValuesList);
  }


  @action
  setInstallments(int value) => transactiononline.installments = value;

  @action
  setAmount(int value) => transactiononline.value = value;


  @action
  setvisibilityModalblueth(bool value) => visibilityModalBluetooth = value;



}