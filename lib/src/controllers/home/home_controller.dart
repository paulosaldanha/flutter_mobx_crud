import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController();

  @observable
  double sizeCard = 200;

  @action
  setSizeCard() {
    if(sizeCard == 200){
       sizeCard = 500;
    }else{
      sizeCard = 200;
    }
  }

}