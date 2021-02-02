import 'package:ecommerceBankPay/src/models/tax.dart';
import 'package:ecommerceBankPay/src/util/tax_method_payment_service.dart';
import 'package:mobx/mobx.dart';

part 'transaction_list_combo_controller.g.dart';

class TransactionListComboController = _TransactionListComboController
    with _$TransactionListComboController;

abstract class _TransactionListComboController with Store {
  _TransactionListComboController();
  TaxMethodPaymentService taxMethodPaymentService = TaxMethodPaymentService();

  @observable
  List<Tax> amountValuesCreditCardList;
  @observable
  List<Tax> amountValuesDebitCardList;
  @observable
  String selectedString;
  @observable
  int amountComboList;
  @observable
  int installmentsComboList;
  @observable
  bool loading = false;

  @action
  selectedState(Tax value) {
    selectedString = value.descriptionValue;
    amountComboList = (value.amount * 100).toInt();
    installmentsComboList = value.installments;
  }

  @action
  bool setStateLoading(value) => loading = value;

  @action
  getTaxCredit(currentValues) {
    loading = true;
    amountValuesCreditCardList = List();
    taxMethodPaymentService.convertCurrentValueAndAmountCredit(currentValues)
        .then((v) {
      var listTax = new List<double>.from(v);
      for (var i = 0; i < listTax.length; i++) {
        amountValuesCreditCardList.add(Tax(
            listTax[i],
            'R\$ ${_changeValueParcel(listTax[i], i + 1)}',
            i + 1));
      }
      loading = false;
    });
  }

  String _changeValueParcel(double value, int parcel) {
    if (parcel != 1) {
      String res = (value / parcel).toStringAsFixed(2);
      return res.replaceAll('.', ',');
    } else {
      return value.toStringAsFixed(2).replaceAll('.', ',');
    }
  }

  @action
  getTaxDebit(currentValues) {
    amountValuesDebitCardList = List();
    taxMethodPaymentService.convertCurrentValueAndAmountDebit(currentValues)
        .then((v) {
      var listTax = new List<double>.from(v);
      amountValuesDebitCardList
          .add(Tax(listTax[0], '1 x de R\$ ${listTax[0]}', 1));
    });
  }
}
