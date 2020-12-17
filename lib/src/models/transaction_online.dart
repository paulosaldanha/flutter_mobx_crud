import 'package:mobx/mobx.dart';

part 'transaction_online.g.dart';

class TransactionOnline = _TransactionOnlineBase with _$TransactionOnline;

abstract class _TransactionOnlineBase with Store {
  @observable
  String name;
  @observable
  String email;
  @observable
  String document;
  @observable
  String ddd;
  @observable
  String telephone;
  @observable
  double value;
  @observable
  int installments;
  @observable
  String cardNumber;
  @observable
  String cardName;
  @observable
  String cardCVV;
  @observable
  String cardDateExpiration;


  @action
  setNome(String value) => name = value;
  @action
  setEmail(String value) => email = value;
  @action
  setDocument(String value) => document = value;
  @action
  setDdd(String value) => ddd = value;
  @action
  setTelephone(String value) => telephone = value;
  @action
  setValue(int valueBillet) {
    value = valueBillet/100;
    print(installments);
    print(value);
  }
  @action
  setDateExpiration(String value) => cardDateExpiration = value;
  @action
  setInstallments(int value) => installments = value;
  @action
  setCardNumber(String value) => cardNumber = value;
  @action
  setCardName(String value) => cardName = value;
  @action
  setCardCVV(String value) => cardCVV = value;
}
