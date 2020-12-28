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
        setCurrentValueTax(0.00);
        return currentValues = "0,00";
      }
      currentValuesList.removeLast();
      if (currentValuesList.length > 0) {
        currentValues =
            TaxMethodPaymentService.convertToString(currentValuesList);
        String newValue = currentValues.replaceAll(",", ".");
        if (double.parse(newValue) > 0) {
          dynamic taxa = await getTax(newValue, 1);
          setCurrentValueTax(taxa[0]);
        } else {
          setCurrentValueTax(0.00);
        }
        return currentValues;
      } else {
        setCurrentValueTax(0.00);
        return currentValues = "0,00";
      }
    }
    if (currentValuesList.length == 0 && (value == "0" || value == "00")) {
      return currentValues = "0,00";
    }
    if (!(currentValuesList.length >= 7)) {
      if (value == "00") {
        if (!(currentValuesList.length == 6)) {
          currentValuesList.add("0");
        }
        currentValuesList.add("0");
      } else {
        currentValuesList.add(value);
      }
    }
    currentValues = TaxMethodPaymentService.convertToString(currentValuesList);
    String newValue = currentValues.replaceAll(",", ".");
    if (double.parse(newValue) > 0) {
      dynamic taxa = await getTax(newValue, 1);
      setCurrentValueTax(taxa[0]);
    } else {
      setCurrentValueTax(0.00);
    }
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
