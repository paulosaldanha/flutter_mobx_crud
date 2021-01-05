// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_online_part2_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionOnlinePart2Controller
    on _TransactionOnlinePart2Controller, Store {
  final _$currentValuesAtom =
      Atom(name: '_TransactionOnlinePart2Controller.currentValues');

  @override
  String get currentValues {
    _$currentValuesAtom.context.enforceReadPolicy(_$currentValuesAtom);
    _$currentValuesAtom.reportObserved();
    return super.currentValues;
  }

  @override
  set currentValues(String value) {
    _$currentValuesAtom.context.conditionallyRunInAction(() {
      super.currentValues = value;
      _$currentValuesAtom.reportChanged();
    }, _$currentValuesAtom, name: '${_$currentValuesAtom.name}_set');
  }

  final _$currentValuesListAtom =
      Atom(name: '_TransactionOnlinePart2Controller.currentValuesList');

  @override
  List<dynamic> get currentValuesList {
    _$currentValuesListAtom.context.enforceReadPolicy(_$currentValuesListAtom);
    _$currentValuesListAtom.reportObserved();
    return super.currentValuesList;
  }

  @override
  set currentValuesList(List<dynamic> value) {
    _$currentValuesListAtom.context.conditionallyRunInAction(() {
      super.currentValuesList = value;
      _$currentValuesListAtom.reportChanged();
    }, _$currentValuesListAtom, name: '${_$currentValuesListAtom.name}_set');
  }

  final _$visibilityModalBluetoothAtom =
      Atom(name: '_TransactionOnlinePart2Controller.visibilityModalBluetooth');

  @override
  bool get visibilityModalBluetooth {
    _$visibilityModalBluetoothAtom.context
        .enforceReadPolicy(_$visibilityModalBluetoothAtom);
    _$visibilityModalBluetoothAtom.reportObserved();
    return super.visibilityModalBluetooth;
  }

  @override
  set visibilityModalBluetooth(bool value) {
    _$visibilityModalBluetoothAtom.context.conditionallyRunInAction(() {
      super.visibilityModalBluetooth = value;
      _$visibilityModalBluetoothAtom.reportChanged();
    }, _$visibilityModalBluetoothAtom,
        name: '${_$visibilityModalBluetoothAtom.name}_set');
  }

  final _$_TransactionOnlinePart2ControllerActionController =
      ActionController(name: '_TransactionOnlinePart2Controller');

  @override
  dynamic setCurrentValues(String value) {
    final _$actionInfo =
        _$_TransactionOnlinePart2ControllerActionController.startAction();
    try {
      return super.setCurrentValues(value);
    } finally {
      _$_TransactionOnlinePart2ControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstallments(int value) {
    final _$actionInfo =
        _$_TransactionOnlinePart2ControllerActionController.startAction();
    try {
      return super.setInstallments(value);
    } finally {
      _$_TransactionOnlinePart2ControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmount(int value) {
    final _$actionInfo =
        _$_TransactionOnlinePart2ControllerActionController.startAction();
    try {
      return super.setAmount(value);
    } finally {
      _$_TransactionOnlinePart2ControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setvisibilityModalblueth(bool value) {
    final _$actionInfo =
        _$_TransactionOnlinePart2ControllerActionController.startAction();
    try {
      return super.setvisibilityModalblueth(value);
    } finally {
      _$_TransactionOnlinePart2ControllerActionController
          .endAction(_$actionInfo);
    }
  }
}
