import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/models/taxa.dart';
import 'package:estruturabasica/src/util/device_service.dart';
import 'package:estruturabasica/src/util/taxa_method_payment_service.dart';
import 'package:mobx/mobx.dart';
import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';

part 'transaction_Mpos.g.dart';

class TransactionMpos = _TransactionMposBase with _$TransactionMpos;

abstract class _TransactionMposBase with Store {
  PagarmeMpos mpos = new PagarmeMpos();

  @observable
  String deviceName;
  @observable
  PaymentMethod paymentMethod;
  @observable
  int installments;
  @observable
  int amount;
  @observable
  String currentValues = "0,00";
  @observable
  List currentValuesList = List();
  @observable
  List<Taxa> amountValuesCreditCardList = List();
  @observable
  String selectedString;

  @action
  selectedState(Taxa value) {
    selectedString = value.descriptionValue;
    amount = (value.amount * 100).toInt();
    installments = value.installments;
  }

  @action
  setDeviceName(String value) => deviceName = value;

  @action
  setPaymentMethod(
      String value, TransactionMposController transactionController){
    if (value == 'credito') {
      paymentMethod = PaymentMethod.CreditCard;
       TaxaMethodPaymentService
           .convertCurrentValueAndAmountCredit(currentValues).then((v) {
         var listTaxa = new List<double>.from(v);
         for (var i = 0; i < listTaxa.length; i++) {
            amountValuesCreditCardList.add( Taxa(listTaxa[i],'${i+1} x de R\$ ${listTaxa[i]}',i+1));
         }
       });
    }
    if (value == 'debito') {
      paymentMethod = PaymentMethod.DebitCard;
      installments = 1;
      initPlatformState(transactionController);
    }
  }

  @action
  setInstallments(String value) => installments = int.parse(value);

  @action
  setAmount(String value) => amount = int.parse(value);

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

  Future<void> initPlatformState(
      TransactionMposController transactionMposController) async {
    transactionMposController.setImgStatus('images/pay.png');
    transactionMposController.setStatus(1);
    DeviceService device = new DeviceService(
      deviceName: deviceName,
      amount: amount,
      installments: installments,
      paymentMethod: paymentMethod,
      mpos: mpos,
      status: transactionMposController,
    );
  }

  _TransactionMposBase.construtorParametro(
      this.deviceName, this.paymentMethod, this.installments, this.amount);

  _TransactionMposBase();
}
