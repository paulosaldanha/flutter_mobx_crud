import 'package:mobx/mobx.dart';
part 'tax.g.dart';

class Tax = _TaxBase with _$Tax;

abstract class _TaxBase with Store {

  @observable
  double amount;
  @observable
  int installments;
  @observable
  String descriptionValue;


  @action
  setAmount(String value) => amount = double.parse(value);

  @action
  setInstallments(String value) => installments = int.parse(value);

  @action
  setDescriptionValue(String value) => descriptionValue = value;

  _TaxBase (this.amount, this.descriptionValue, this.installments);

  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'amount': amount,
      'descriptionValue': descriptionValue,
    };
    return map;
  }

  _TaxBase.fromMap(Map<String,dynamic> map){
    amount = map['amount'];
    descriptionValue = map['descriptionValue'];
  }
}