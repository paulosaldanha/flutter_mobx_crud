// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list_combo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionListComboController
    on _TransactionListComboController, Store {
  final _$amountValuesCreditCardListAtom =
      Atom(name: '_TransactionListComboController.amountValuesCreditCardList');

  @override
  List<Taxa> get amountValuesCreditCardList {
    _$amountValuesCreditCardListAtom.context
        .enforceReadPolicy(_$amountValuesCreditCardListAtom);
    _$amountValuesCreditCardListAtom.reportObserved();
    return super.amountValuesCreditCardList;
  }

  @override
  set amountValuesCreditCardList(List<Taxa> value) {
    _$amountValuesCreditCardListAtom.context.conditionallyRunInAction(() {
      super.amountValuesCreditCardList = value;
      _$amountValuesCreditCardListAtom.reportChanged();
    }, _$amountValuesCreditCardListAtom,
        name: '${_$amountValuesCreditCardListAtom.name}_set');
  }

  final _$amountValuesDebitCardListAtom =
      Atom(name: '_TransactionListComboController.amountValuesDebitCardList');

  @override
  List<Taxa> get amountValuesDebitCardList {
    _$amountValuesDebitCardListAtom.context
        .enforceReadPolicy(_$amountValuesDebitCardListAtom);
    _$amountValuesDebitCardListAtom.reportObserved();
    return super.amountValuesDebitCardList;
  }

  @override
  set amountValuesDebitCardList(List<Taxa> value) {
    _$amountValuesDebitCardListAtom.context.conditionallyRunInAction(() {
      super.amountValuesDebitCardList = value;
      _$amountValuesDebitCardListAtom.reportChanged();
    }, _$amountValuesDebitCardListAtom,
        name: '${_$amountValuesDebitCardListAtom.name}_set');
  }

  final _$selectedStringAtom =
      Atom(name: '_TransactionListComboController.selectedString');

  @override
  String get selectedString {
    _$selectedStringAtom.context.enforceReadPolicy(_$selectedStringAtom);
    _$selectedStringAtom.reportObserved();
    return super.selectedString;
  }

  @override
  set selectedString(String value) {
    _$selectedStringAtom.context.conditionallyRunInAction(() {
      super.selectedString = value;
      _$selectedStringAtom.reportChanged();
    }, _$selectedStringAtom, name: '${_$selectedStringAtom.name}_set');
  }

  final _$amountComboListAtom =
      Atom(name: '_TransactionListComboController.amountComboList');

  @override
  int get amountComboList {
    _$amountComboListAtom.context.enforceReadPolicy(_$amountComboListAtom);
    _$amountComboListAtom.reportObserved();
    return super.amountComboList;
  }

  @override
  set amountComboList(int value) {
    _$amountComboListAtom.context.conditionallyRunInAction(() {
      super.amountComboList = value;
      _$amountComboListAtom.reportChanged();
    }, _$amountComboListAtom, name: '${_$amountComboListAtom.name}_set');
  }

  final _$installmentsComboListAtom =
      Atom(name: '_TransactionListComboController.installmentsComboList');

  @override
  int get installmentsComboList {
    _$installmentsComboListAtom.context
        .enforceReadPolicy(_$installmentsComboListAtom);
    _$installmentsComboListAtom.reportObserved();
    return super.installmentsComboList;
  }

  @override
  set installmentsComboList(int value) {
    _$installmentsComboListAtom.context.conditionallyRunInAction(() {
      super.installmentsComboList = value;
      _$installmentsComboListAtom.reportChanged();
    }, _$installmentsComboListAtom,
        name: '${_$installmentsComboListAtom.name}_set');
  }

  final _$_TransactionListComboControllerActionController =
      ActionController(name: '_TransactionListComboController');

  @override
  dynamic selectedState(Taxa value) {
    final _$actionInfo =
        _$_TransactionListComboControllerActionController.startAction();
    try {
      return super.selectedState(value);
    } finally {
      _$_TransactionListComboControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTaxasCredit(dynamic currentValues) {
    final _$actionInfo =
        _$_TransactionListComboControllerActionController.startAction();
    try {
      return super.getTaxasCredit(currentValues);
    } finally {
      _$_TransactionListComboControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTaxasDebit(dynamic currentValues) {
    final _$actionInfo =
        _$_TransactionListComboControllerActionController.startAction();
    try {
      return super.getTaxasDebit(currentValues);
    } finally {
      _$_TransactionListComboControllerActionController.endAction(_$actionInfo);
    }
  }
}
