import 'package:estruturabasica/src/models/taxa.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/util/taxa_method_payment_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'transaction_list_combo_controller.g.dart';

class TransactionListComboController = _TransactionListComboController with _$TransactionListComboController;

abstract class _TransactionListComboController with Store {
  _TransactionListComboController();

  @observable
  List<Taxa> amountValuesCreditCardList;
  @observable
  List<Taxa> amountValuesDebitCardList;
  @observable
  String selectedString;
  @observable
  int amountComboList;
  @observable
  int installmentsComboList;


  @action
  selectedState(Taxa value) {
    selectedString = value.descriptionValue;
    amountComboList = (value.amount * 100).toInt();
    installmentsComboList = value.installments;
  }

  @action
  getTaxasCredit(currentValues){
    amountValuesCreditCardList = List();
    TaxaMethodPaymentService
        .convertCurrentValueAndAmountCredit(currentValues).then((v) {
      var listTaxa = new List<double>.from(v);
      for (var i = 0; i < listTaxa.length; i++) {

        amountValuesCreditCardList.add( Taxa(listTaxa[i],'${i+1} x de R\$ ${_changeValueParcel(listTaxa[i],i+1)}',i+1));
      }
    });
  }

  String _changeValueParcel(double value, int parcel){
    if(parcel != 1){
      String res = (value/parcel).toStringAsFixed(2);
      return res.replaceAll('.', ',');
    }else{
      return value.toStringAsFixed(2).replaceAll('.', ',');
    }

  }

  @action
  getTaxasDebit(currentValues){
    amountValuesDebitCardList = List();
    TaxaMethodPaymentService
        .convertCurrentValueAndAmountDebit(currentValues).then((v) {
      var listTaxa = new List<double>.from(v);
      amountValuesDebitCardList.add( Taxa(listTaxa[0], '1 x de R\$ ${listTaxa[0]}',1));
    });
  }

}