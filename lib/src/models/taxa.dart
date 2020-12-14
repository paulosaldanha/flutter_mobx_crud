import 'package:mobx/mobx.dart';
part 'taxa.g.dart';

class Taxa = _TaxaBase with _$Taxa;

abstract class _TaxaBase with Store {

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

  _TaxaBase (this.amount, this.descriptionValue, this.installments);

  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'amount': amount,
      'descriptionValue': descriptionValue,
    };
    return map;
  }

  _TaxaBase.fromMap(Map<String,dynamic> map){
    amount = map['amount'];
    descriptionValue = map['descriptionValue'];
  }
}