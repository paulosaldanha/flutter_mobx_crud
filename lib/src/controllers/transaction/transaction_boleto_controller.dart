import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:estruturabasica/src/util/tax_method_payment_service.dart';
import 'package:mobx/mobx.dart';

part 'transaction_boleto_controller.g.dart';

class TransactionBoletoController = _TransactionBoletoController
    with _$TransactionBoletoController;

abstract class _TransactionBoletoController with Store {
  Boleto transactionBoleto = Boleto();

  _TransactionBoletoController();

  @observable
  String currentValues = "0,00";
  @observable
  double currentValuesTax = 0.00;
  @observable
  List currentValuesList = List();
  @observable
  bool visibilityModalBluetooth = true;

  @action
  setCurrentValues(String value) async {
    if (value == "clear") {
      if (currentValuesList.length == 0) {
        return currentValues = "0,00";
      }
      currentValuesList.removeLast();
      currentValues =
          TaxMethodPaymentService.convertToString(currentValuesList);
      String newValue = currentValues.replaceAll(",", ".");
      dynamic taxa = await getTax(newValue, 1);
      setCurrentValueTax(taxa[0]);
      return currentValues;
    }
    if (!(currentValuesList.length == 7)) {
      currentValuesList.add(value);
    }
    currentValues = TaxMethodPaymentService.convertToString(currentValuesList);
    String newValue = currentValues.replaceAll(",", ".");
    dynamic taxa = await getTax(newValue, 1);
    setCurrentValueTax(taxa[0]);
    return currentValues;
  }

  @action
  setCurrentValueTax(value) {
    currentValuesTax = value;
    if (currentValues == null) {
      currentValuesTax = 0.00;
    }
  }
}
