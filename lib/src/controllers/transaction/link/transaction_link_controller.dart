import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:estruturabasica/src/util/tax_method_payment_service.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:mobx/mobx.dart';

part 'transaction_link_controller.g.dart';

class TransactionLinkController = _TransactionLinkController
    with _$TransactionLinkController;

abstract class _TransactionLinkController with Store {
  TransactionLink transactionLink = TransactionLink();
  TransactionService transactionService = TransactionService(Api());

  _TransactionLinkController();

  @observable
  String currentValues = "0,00";
  @observable
  double currentValuesTax = 0.00;
  @observable
  List currentValuesList = List();
  @observable
  List parcelas = [];
  @observable
  bool visibilityModalBluetooth = true;

  @action
  setCurrentValues(String value) async {
    if (value == "clear") {
      if (currentValuesList.length == 0) {
        return currentValues = "0,00";
      }
      currentValuesList.removeLast();
      if (currentValuesList.length > 0) {
        currentValues =
            TaxMethodPaymentService.convertToString(currentValuesList);
        return currentValues;
      } else {
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
    return currentValues;
  }

  @computed
  bool get validValue =>
      (double.parse(currentValues.replaceAll(",", ".")) >= 10.00);

  @computed
  bool get isValid {
    return validValue;
  }

  dynamic getParcelas(value) async {
    dynamic taxas = await transactionService.getTax(value, 3);
    parcelas = [];
    for (int i = 0; i < taxas.length; i++) {
      dynamic parcela;
      String valor = taxas[i].toStringAsFixed(2).replaceAll(".", ",");
      if (i == 0) {
        parcela = new List();
        parcela.add(i + 1);
        parcela.add("1 Parcela - R\$ $valor");
      } else {
        parcela = new List();
        parcela.add(i + 1);
        parcela.add("${i + 1} Parcelas - R\$ $valor");
      }
      parcelas.add(parcela);
    }
    return parcelas.toList();
  }
}
