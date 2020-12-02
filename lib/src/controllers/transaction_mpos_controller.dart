import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
part 'transaction_mpos_controller.g.dart';

class TransactionMposController = _TransactionMposController with _$TransactionMposController;

abstract class _TransactionMposController with Store {

  _TransactionMposController();

  var transactionmpos = TransactionMpos();
  String validateDeviceName(){
    if(transactionmpos.deviceName == null || transactionmpos.deviceName.isEmpty){
      return "Campo obrigatório";
    }
    return null;
  }
  String validateAmount(){
    if(transactionmpos.amount != null && transactionmpos.amount <= 0){
      return "Campo não pode ser menor que 0";
    }
    return null;
  }
  String validateInstallments(){
    if(transactionmpos.installments != null && transactionmpos.installments <= 0){
      return "Campo não pode ser menor que 0";
    }
    return null;
  }



  @computed
  bool get isValid {
    return validateDeviceName() == null && validateAmount() == null && validateInstallments() == null;
  }
}