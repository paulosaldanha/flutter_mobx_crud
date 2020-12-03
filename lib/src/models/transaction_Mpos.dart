import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/util/device_service.dart';
import 'package:estruturabasica/src/util/taxa_method_payment_service.dart';
import 'package:mobx/mobx.dart';
import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';

part 'transaction_Mpos.g.dart';

class TransactionMpos = _TransactionMposBase with _$TransactionMpos;
abstract class _TransactionMposBase with Store {

  PagarmeMpos mpos = new PagarmeMpos();

  int id;
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

  @action
  setDeviceName(String value) => deviceName = value;

  @action
  setPaymentMethod(String value, TransactionMposController transactionController) {
    if(value == 'credito'){
      paymentMethod = PaymentMethod.CreditCard;
      amount = TaxaMethodPaymentService.convertCurrentValueAndAmount(currentValues, 'credito');
    }
    if(value == 'debito'){
      paymentMethod = PaymentMethod.DebitCard;
      installments = 1;
      amount = TaxaMethodPaymentService.convertCurrentValueAndAmount(currentValues, 'debito');
      initPlatformState(transactionController);
    }
  }

  @action
  setInstallments(String value) => installments = int.parse(value);

  @action
  setAmount(String value) => amount = int.parse(value);

  @action
  setCurrentValues(String value) {
    if(value == "clear"){
      if(currentValuesList.length == 0){
        return currentValues = "0,00";
      }
      currentValuesList.removeLast();
      return currentValues = TaxaMethodPaymentService.convertToString(currentValuesList);
    }
    if(!(currentValuesList.length == 7)){
      currentValuesList.add(value);
    }
      return currentValues = TaxaMethodPaymentService.convertToString(currentValuesList);
  }

  Future<void> initPlatformState(TransactionMposController transactionMposController) async {
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