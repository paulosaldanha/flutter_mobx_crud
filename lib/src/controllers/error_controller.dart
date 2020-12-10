import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'error_controller.g.dart';

class ErrorController = _ErrorController with _$ErrorController;

abstract class _ErrorController with Store {

  _ErrorController();

  @observable
  bool visibility = false;
  @observable
  String text ;


  @action
  setVisibility(bool value) => visibility = value;

  @action
  setText(String value) => text = value;

  @action
 Widget message(context){
    Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text(this.text)
        )
    );
    return Text('');
  }

}