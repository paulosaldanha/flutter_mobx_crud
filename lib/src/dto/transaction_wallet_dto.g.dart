// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_wallet_dto.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionWalletDto on _TransactionWalletDto, Store {
  final _$valueWalletAtom = Atom(name: '_TransactionWalletDto.valueWallet');

  @override
  String get valueWallet {
    _$valueWalletAtom.context.enforceReadPolicy(_$valueWalletAtom);
    _$valueWalletAtom.reportObserved();
    return super.valueWallet;
  }

  @override
  set valueWallet(String value) {
    _$valueWalletAtom.context.conditionallyRunInAction(() {
      super.valueWallet = value;
      _$valueWalletAtom.reportChanged();
    }, _$valueWalletAtom, name: '${_$valueWalletAtom.name}_set');
  }

  final _$transactionListAtom =
      Atom(name: '_TransactionWalletDto.transactionList');

  @override
  ObservableList<Transaction> get transactionList {
    _$transactionListAtom.context.enforceReadPolicy(_$transactionListAtom);
    _$transactionListAtom.reportObserved();
    return super.transactionList;
  }

  @override
  set transactionList(ObservableList<Transaction> value) {
    _$transactionListAtom.context.conditionallyRunInAction(() {
      super.transactionList = value;
      _$transactionListAtom.reportChanged();
    }, _$transactionListAtom, name: '${_$transactionListAtom.name}_set');
  }

  final _$_TransactionWalletDtoActionController =
      ActionController(name: '_TransactionWalletDto');

  @override
  void setvalueWallet(String value) {
    final _$actionInfo = _$_TransactionWalletDtoActionController.startAction();
    try {
      return super.setvalueWallet(value);
    } finally {
      _$_TransactionWalletDtoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void settransactionList(List<Transaction> value) {
    final _$actionInfo = _$_TransactionWalletDtoActionController.startAction();
    try {
      return super.settransactionList(value);
    } finally {
      _$_TransactionWalletDtoActionController.endAction(_$actionInfo);
    }
  }
}
