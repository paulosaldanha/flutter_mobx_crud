import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../main.dart';
part 'transaction_mpos_controller.g.dart';

class TransactionMposController = _TransactionMposController with _$TransactionMposController;

abstract class _TransactionMposController with Store {

  _TransactionMposController();

  @observable
  int status = 0;
  @observable
  String titleStatus = 'Carregando...' ;
  @observable
  String imgStatus;


  @action
  setStatus(int value) => status = value;

  @action
  setTitleStatus(String value) => titleStatus = value;

  @action
  setImgStatus(String value) => imgStatus = value;

  @action
  endModal(context){
    Navigator.pop(context);
    Navigator.of(context).pushNamed(HomeViewRoute);
  }

}