import 'package:mobx/mobx.dart';

part 'transaction_modal_controller.g.dart';

class TransactionModalController = _TransactionModalController
    with _$TransactionModalController;

abstract class _TransactionModalController with Store {
  _TransactionModalController();

  @observable
  int status = 0;
  @observable
  String titleStatus = 'Carregando...';
  @observable
  String imgStatus;

  @action
  setStatus(int value) => status = value;

  @action
  setTitleStatus(String value) => titleStatus = value;

  @action
  setImgStatus(String value) => imgStatus = value;
}
