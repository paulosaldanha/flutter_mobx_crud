// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_boleto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionBoletoController on _TransactionBoletoController, Store {
  final _$currentValuesAtom =
      Atom(name: '_TransactionBoletoController.currentValues');

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

  final _$currentValuesTaxAtom =
      Atom(name: '_TransactionBoletoController.currentValuesTax');

  @override
  double get currentValuesTax {
    _$currentValuesTaxAtom.context.enforceReadPolicy(_$currentValuesTaxAtom);
    _$currentValuesTaxAtom.reportObserved();
    return super.currentValuesTax;
  }

  @override
  set currentValuesTax(double value) {
    _$currentValuesTaxAtom.context.conditionallyRunInAction(() {
      super.currentValuesTax = value;
      _$currentValuesTaxAtom.reportChanged();
    }, _$currentValuesTaxAtom, name: '${_$currentValuesTaxAtom.name}_set');
  }

  final _$currentValuesListAtom =
      Atom(name: '_TransactionBoletoController.currentValuesList');

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
      Atom(name: '_TransactionBoletoController.visibilityModalBluetooth');

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

  final _$setCurrentValuesAsyncAction = AsyncAction('setCurrentValues');

  @override
  Future setCurrentValues(String value) {
    return _$setCurrentValuesAsyncAction
        .run(() => super.setCurrentValues(value));
  }

  final _$_TransactionBoletoControllerActionController =
      ActionController(name: '_TransactionBoletoController');

  @override
  dynamic setCurrentValueTax(dynamic value) {
    final _$actionInfo =
        _$_TransactionBoletoControllerActionController.startAction();
    try {
      return super.setCurrentValueTax(value);
    } finally {
      _$_TransactionBoletoControllerActionController.endAction(_$actionInfo);
    }
  }
}
