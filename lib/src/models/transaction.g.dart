// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Transaction on _TransactionBase, Store {
  final _$idAtom = Atom(name: '_TransactionBase.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$amountAtom = Atom(name: '_TransactionBase.amount');

  @override
  String get amount {
    _$amountAtom.context.enforceReadPolicy(_$amountAtom);
    _$amountAtom.reportObserved();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.context.conditionallyRunInAction(() {
      super.amount = value;
      _$amountAtom.reportChanged();
    }, _$amountAtom, name: '${_$amountAtom.name}_set');
  }

  final _$idTransactionAtom = Atom(name: '_TransactionBase.idTransaction');

  @override
  String get idTransaction {
    _$idTransactionAtom.context.enforceReadPolicy(_$idTransactionAtom);
    _$idTransactionAtom.reportObserved();
    return super.idTransaction;
  }

  @override
  set idTransaction(String value) {
    _$idTransactionAtom.context.conditionallyRunInAction(() {
      super.idTransaction = value;
      _$idTransactionAtom.reportChanged();
    }, _$idTransactionAtom, name: '${_$idTransactionAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_TransactionBase.name');

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

  final _$documentAtom = Atom(name: '_TransactionBase.document');

  @override
  String get document {
    _$documentAtom.context.enforceReadPolicy(_$documentAtom);
    _$documentAtom.reportObserved();
    return super.document;
  }

  @override
  set document(String value) {
    _$documentAtom.context.conditionallyRunInAction(() {
      super.document = value;
      _$documentAtom.reportChanged();
    }, _$documentAtom, name: '${_$documentAtom.name}_set');
  }

  final _$installmentsAtom = Atom(name: '_TransactionBase.installments');

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

  final _$statusAtom = Atom(name: '_TransactionBase.status');

  @override
  String get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_TransactionBaseActionController =
      ActionController(name: '_TransactionBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_TransactionBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_TransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmount(String value) {
    final _$actionInfo = _$_TransactionBaseActionController.startAction();
    try {
      return super.setAmount(value);
    } finally {
      _$_TransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIdTransaction(String value) {
    final _$actionInfo = _$_TransactionBaseActionController.startAction();
    try {
      return super.setIdTransaction(value);
    } finally {
      _$_TransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setdocument(String value) {
    final _$actionInfo = _$_TransactionBaseActionController.startAction();
    try {
      return super.setdocument(value);
    } finally {
      _$_TransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstallments(String value) {
    final _$actionInfo = _$_TransactionBaseActionController.startAction();
    try {
      return super.setInstallments(value);
    } finally {
      _$_TransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(String value) {
    final _$actionInfo = _$_TransactionBaseActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_TransactionBaseActionController.endAction(_$actionInfo);
    }
  }
}
