// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mpos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionMposController on _TransactionMposController, Store {
  final _$currentValuesAtom =
      Atom(name: '_TransactionMposController.currentValues');

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
      Atom(name: '_TransactionMposController.currentValuesList');

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

  final _$visibilityModalbluethAtom =
      Atom(name: '_TransactionMposController.visibilityModalblueth');

  @override
  bool get visibilityModalblueth {
    _$visibilityModalbluethAtom.context
        .enforceReadPolicy(_$visibilityModalbluethAtom);
    _$visibilityModalbluethAtom.reportObserved();
    return super.visibilityModalblueth;
  }

  @override
  set visibilityModalblueth(bool value) {
    _$visibilityModalbluethAtom.context.conditionallyRunInAction(() {
      super.visibilityModalblueth = value;
      _$visibilityModalbluethAtom.reportChanged();
    }, _$visibilityModalbluethAtom,
        name: '${_$visibilityModalbluethAtom.name}_set');
  }

  final _$_TransactionMposControllerActionController =
      ActionController(name: '_TransactionMposController');

  @override
  dynamic setCurrentValues(String value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setCurrentValues(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeviceName(String value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setDeviceName(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstallments(int value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setInstallments(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmount(int value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setAmount(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setvisibilityModalblueth(bool value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setvisibilityModalblueth(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool deviceIsempty() {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.deviceIsempty();
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaymentMethod(String value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setPaymentMethod(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }
}
