// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_link.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionLink on _TransactionLinkBase, Store {
  final _$nameAtom = Atom(name: '_TransactionLinkBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_TransactionLinkBase.value');

  @override
  double get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$installmentsAtom = Atom(name: '_TransactionLinkBase.installments');

  @override
  String get installments {
    _$installmentsAtom.context.enforceReadPolicy(_$installmentsAtom);
    _$installmentsAtom.reportObserved();
    return super.installments;
  }

  @override
  set installments(String value) {
    _$installmentsAtom.context.conditionallyRunInAction(() {
      super.installments = value;
      _$installmentsAtom.reportChanged();
    }, _$installmentsAtom, name: '${_$installmentsAtom.name}_set');
  }

  final _$dateExpirationAtom =
      Atom(name: '_TransactionLinkBase.dateExpiration');

  @override
  DateTime get dateExpiration {
    _$dateExpirationAtom.context.enforceReadPolicy(_$dateExpirationAtom);
    _$dateExpirationAtom.reportObserved();
    return super.dateExpiration;
  }

  @override
  set dateExpiration(DateTime value) {
    _$dateExpirationAtom.context.conditionallyRunInAction(() {
      super.dateExpiration = value;
      _$dateExpirationAtom.reportChanged();
    }, _$dateExpirationAtom, name: '${_$dateExpirationAtom.name}_set');
  }

  final _$valueTaxAtom = Atom(name: '_TransactionLinkBase.valueTax');

  @override
  double get valueTax {
    _$valueTaxAtom.context.enforceReadPolicy(_$valueTaxAtom);
    _$valueTaxAtom.reportObserved();
    return super.valueTax;
  }

  @override
  set valueTax(double value) {
    _$valueTaxAtom.context.conditionallyRunInAction(() {
      super.valueTax = value;
      _$valueTaxAtom.reportChanged();
    }, _$valueTaxAtom, name: '${_$valueTaxAtom.name}_set');
  }

  final _$setValueTaxAsyncAction = AsyncAction('setValueTax');

  @override
  Future setValueTax(String value) {
    return _$setValueTaxAsyncAction.run(() => super.setValueTax(value));
  }

  final _$_TransactionLinkBaseActionController =
      ActionController(name: '_TransactionLinkBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_TransactionLinkBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_TransactionLinkBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(String valueBillet) {
    final _$actionInfo = _$_TransactionLinkBaseActionController.startAction();
    try {
      return super.setValue(valueBillet);
    } finally {
      _$_TransactionLinkBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstallments(String parcela) {
    final _$actionInfo = _$_TransactionLinkBaseActionController.startAction();
    try {
      return super.setInstallments(parcela);
    } finally {
      _$_TransactionLinkBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDateExpiration(DateTime value) {
    final _$actionInfo = _$_TransactionLinkBaseActionController.startAction();
    try {
      return super.setDateExpiration(value);
    } finally {
      _$_TransactionLinkBaseActionController.endAction(_$actionInfo);
    }
  }
}
