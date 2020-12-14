import 'package:mobx/mobx.dart';
import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';

part 'transaction_Mpos.g.dart';

class TransactionMpos = _TransactionMposBase with _$TransactionMpos;

abstract class _TransactionMposBase with Store {

  @observable
  String deviceName;
  @observable
  PaymentMethod paymentMethod;
  @observable
  int installments;
  @observable
  int amount;

  @action
  setDeviceName(String value) => deviceName = value;

  @action
  setPaymentMethod(PaymentMethod value)=> paymentMethod = value;

  @action
  setInstallments(String value) => installments = int.parse(value);

  @action
  setAmount(String value) => amount = int.parse(value);

}
