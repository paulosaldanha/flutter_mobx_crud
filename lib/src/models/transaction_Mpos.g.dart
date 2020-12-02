// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_Mpos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionMpos on _TransactionMposBase, Store {
  final _$deviceNameAtom = Atom(name: '_TransactionMposBase.deviceName');

  @override
  String get deviceName {
    _$deviceNameAtom.context.enforceReadPolicy(_$deviceNameAtom);
    _$deviceNameAtom.reportObserved();
    return super.deviceName;
  }

  @override
  set deviceName(String value) {
    _$deviceNameAtom.context.conditionallyRunInAction(() {
      super.deviceName = value;
      _$deviceNameAtom.reportChanged();
    }, _$deviceNameAtom, name: '${_$deviceNameAtom.name}_set');
  }

  final _$paymentMethodAtom = Atom(name: '_TransactionMposBase.paymentMethod');

  @override
  String get paymentMethod {
    _$paymentMethodAtom.context.enforceReadPolicy(_$paymentMethodAtom);
    _$paymentMethodAtom.reportObserved();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(String value) {
    _$paymentMethodAtom.context.conditionallyRunInAction(() {
      super.paymentMethod = value;
      _$paymentMethodAtom.reportChanged();
    }, _$paymentMethodAtom, name: '${_$paymentMethodAtom.name}_set');
  }

  final _$installmentsAtom = Atom(name: '_TransactionMposBase.installments');

  @override
  int get installments {
    _$installmentsAtom.context.enforceReadPolicy(_$installmentsAtom);
    _$installmentsAtom.reportObserved();
    return super.installments;
  }

  @override
  set installments(int value) {
    _$installmentsAtom.context.conditionallyRunInAction(() {
      super.installments = value;
      _$installmentsAtom.reportChanged();
    }, _$installmentsAtom, name: '${_$installmentsAtom.name}_set');
  }

  final _$amountAtom = Atom(name: '_TransactionMposBase.amount');

  @override
  int get amount {
    _$amountAtom.context.enforceReadPolicy(_$amountAtom);
    _$amountAtom.reportObserved();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.context.conditionallyRunInAction(() {
      super.amount = value;
      _$amountAtom.reportChanged();
    }, _$amountAtom, name: '${_$amountAtom.name}_set');
  }

  final _$currentValuesAtom = Atom(name: '_TransactionMposBase.currentValues');

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
      Atom(name: '_TransactionMposBase.currentValuesList');

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

  final _$_TransactionMposBaseActionController =
      ActionController(name: '_TransactionMposBase');

  @override
  dynamic setDeviceName(String value) {
    final _$actionInfo = _$_TransactionMposBaseActionController.startAction();
    try {
      return super.setDeviceName(value);
    } finally {
      _$_TransactionMposBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPaymentMethod(String value) {
    final _$actionInfo = _$_TransactionMposBaseActionController.startAction();
    try {
      return super.setPaymentMethod(value);
    } finally {
      _$_TransactionMposBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstallments(String value) {
    final _$actionInfo = _$_TransactionMposBaseActionController.startAction();
    try {
      return super.setInstallments(value);
    } finally {
      _$_TransactionMposBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmount(String value) {
    final _$actionInfo = _$_TransactionMposBaseActionController.startAction();
    try {
      return super.setAmount(value);
    } finally {
      _$_TransactionMposBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentValues(String value) {
    final _$actionInfo = _$_TransactionMposBaseActionController.startAction();
    try {
      return super.setCurrentValues(value);
    } finally {
      _$_TransactionMposBaseActionController.endAction(_$actionInfo);
    }
  }
}
