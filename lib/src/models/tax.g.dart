// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Tax on _TaxBase, Store {
  final _$amountAtom = Atom(name: '_TaxBase.amount');

  @override
  double get amount {
    _$amountAtom.context.enforceReadPolicy(_$amountAtom);
    _$amountAtom.reportObserved();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.context.conditionallyRunInAction(() {
      super.amount = value;
      _$amountAtom.reportChanged();
    }, _$amountAtom, name: '${_$amountAtom.name}_set');
  }

  final _$installmentsAtom = Atom(name: '_TaxBase.installments');

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

  final _$descriptionValueAtom = Atom(name: '_TaxBase.descriptionValue');

  @override
  String get descriptionValue {
    _$descriptionValueAtom.context.enforceReadPolicy(_$descriptionValueAtom);
    _$descriptionValueAtom.reportObserved();
    return super.descriptionValue;
  }

  @override
  set descriptionValue(String value) {
    _$descriptionValueAtom.context.conditionallyRunInAction(() {
      super.descriptionValue = value;
      _$descriptionValueAtom.reportChanged();
    }, _$descriptionValueAtom, name: '${_$descriptionValueAtom.name}_set');
  }

  final _$_TaxBaseActionController = ActionController(name: '_TaxBase');

  @override
  dynamic setAmount(String value) {
    final _$actionInfo = _$_TaxBaseActionController.startAction();
    try {
      return super.setAmount(value);
    } finally {
      _$_TaxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstallments(String value) {
    final _$actionInfo = _$_TaxBaseActionController.startAction();
    try {
      return super.setInstallments(value);
    } finally {
      _$_TaxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescriptionValue(String value) {
    final _$actionInfo = _$_TaxBaseActionController.startAction();
    try {
      return super.setDescriptionValue(value);
    } finally {
      _$_TaxBaseActionController.endAction(_$actionInfo);
    }
  }
}
