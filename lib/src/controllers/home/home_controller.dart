import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController();

  @observable
  double sizeCard = 200;

  @observable
  String walletValue = '0,00';

  @action
  setSizeCard() {
    if(sizeCard == 200){
       sizeCard = 500;
    }else{
      sizeCard = 200;
    }
  }

  Future<dynamic> getWallet() async {
    var res = await getWalletValue();
    walletValue = res['totalVolumePeriodo'].toString().replaceAll('.', ',');
    return  res;
  }

}