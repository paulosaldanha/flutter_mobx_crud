import 'package:mobx/mobx.dart';
part 'transaction_mpos_controller.g.dart';

class TransactionMposController = _TransactionMposController with _$TransactionMposController;

abstract class _TransactionMposController with Store {

  _TransactionMposController();

  @observable
  int status = 0;

  @action
  setDeviceName(int value) => status = value;

}