// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$sizeCardAtom = Atom(name: '_HomeController.sizeCard');

  @override
  double get sizeCard {
    _$sizeCardAtom.context.enforceReadPolicy(_$sizeCardAtom);
    _$sizeCardAtom.reportObserved();
    return super.sizeCard;
  }

  @override
  set sizeCard(double value) {
    _$sizeCardAtom.context.conditionallyRunInAction(() {
      super.sizeCard = value;
      _$sizeCardAtom.reportChanged();
    }, _$sizeCardAtom, name: '${_$sizeCardAtom.name}_set');
  }

  final _$walletValueAtom = Atom(name: '_HomeController.walletValue');

  @override
  String get walletValue {
    _$walletValueAtom.context.enforceReadPolicy(_$walletValueAtom);
    _$walletValueAtom.reportObserved();
    return super.walletValue;
  }

  @override
  set walletValue(String value) {
    _$walletValueAtom.context.conditionallyRunInAction(() {
      super.walletValue = value;
      _$walletValueAtom.reportChanged();
    }, _$walletValueAtom, name: '${_$walletValueAtom.name}_set');
  }

  final _$transactionsAtom = Atom(name: '_HomeController.transactions');

  @override
  ObservableList<Transaction> get transactions {
    _$transactionsAtom.context.enforceReadPolicy(_$transactionsAtom);
    _$transactionsAtom.reportObserved();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<Transaction> value) {
    _$transactionsAtom.context.conditionallyRunInAction(() {
      super.transactions = value;
      _$transactionsAtom.reportChanged();
    }, _$transactionsAtom, name: '${_$transactionsAtom.name}_set');
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic setSizeCard() {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.setSizeCard();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }
}
