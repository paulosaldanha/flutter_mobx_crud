import 'package:ecommerceBankPay/src/controllers/transaction/mpos/transaction_modal_controller.dart';
import 'package:ecommerceBankPay/src/models/transaction_Mpos.dart';
import 'package:ecommerceBankPay/src/util/bluetooth_device_service.dart';
import 'package:ecommerceBankPay/src/util/device_service.dart';
import 'package:ecommerceBankPay/src/util/tax_method_payment_service.dart';
import 'package:mobx/mobx.dart';
import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';

part 'transaction_mpos_controller.g.dart';

class TransactionMposController = _TransactionMposController
    with _$TransactionMposController;

abstract class _TransactionMposController with Store {
  TransactionMpos transactionMpos = TransactionMpos();
  BluetoothDeviceService bluetoothDeviceService;

  _TransactionMposController(){
     bluetoothDeviceService = BluetoothDeviceService(transactionMpos);
  }

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
  void setDeviceName(String value) {
    transactionMpos.setDeviceName(value);
  }

  @action
  setInstallments(int value) => transactionMpos.installments = value;

  @action
  setAmount(int value) => transactionMpos.amount = value;

  @computed
  bool get validDevice {
    if (transactionMpos.deviceName != null) {
      return false;
    } else {
      return true;
    }
  }

  @action
  void setPaymentMethod(String value) {
    if (value == 'credito') {
      transactionMpos.setPaymentMethod(PaymentMethod.CreditCard);
    }
    if (value == 'debito') {
      transactionMpos.setPaymentMethod(PaymentMethod.DebitCard);
    }
  }

  @action
  String getPaymentMethod(){
    if(PaymentMethod.CreditCard == transactionMpos.paymentMethod){
      return 'Credito';
    }else{
      return 'Debito';
    }
  }

  Future<void> initPlatformState(
      TransactionModalController transactionModalController, context) async {
    transactionModalController.setImgStatus('images/pay.png');
    transactionModalController.setStatus(1);
    DeviceService device = await DeviceService(
        deviceName: transactionMpos.deviceName,
        amount: transactionMpos.amount,
        installments: transactionMpos.installments,
        paymentMethod: transactionMpos.paymentMethod,
        currentValues: double.parse(currentValues.replaceAll(',', '.')),
        status: transactionModalController,
        context: context);
  }
}
