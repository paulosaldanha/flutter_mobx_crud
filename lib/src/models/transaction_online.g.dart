// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_online.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionOnline on _TransactionOnlineBase, Store {
  final _$nameAtom = Atom(name: '_TransactionOnlineBase.name');

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

  final _$emailAtom = Atom(name: '_TransactionOnlineBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$documentAtom = Atom(name: '_TransactionOnlineBase.document');

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

  final _$dddAtom = Atom(name: '_TransactionOnlineBase.ddd');

  @override
  String get ddd {
    _$dddAtom.context.enforceReadPolicy(_$dddAtom);
    _$dddAtom.reportObserved();
    return super.ddd;
  }

  @override
  set ddd(String value) {
    _$dddAtom.context.conditionallyRunInAction(() {
      super.ddd = value;
      _$dddAtom.reportChanged();
    }, _$dddAtom, name: '${_$dddAtom.name}_set');
  }

  final _$telephoneAtom = Atom(name: '_TransactionOnlineBase.telephone');

  @override
  String get telephone {
    _$telephoneAtom.context.enforceReadPolicy(_$telephoneAtom);
    _$telephoneAtom.reportObserved();
    return super.telephone;
  }

  @override
  set telephone(String value) {
    _$telephoneAtom.context.conditionallyRunInAction(() {
      super.telephone = value;
      _$telephoneAtom.reportChanged();
    }, _$telephoneAtom, name: '${_$telephoneAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_TransactionOnlineBase.value');

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

  final _$installmentsAtom = Atom(name: '_TransactionOnlineBase.installments');

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

  final _$cardNumberAtom = Atom(name: '_TransactionOnlineBase.cardNumber');

  @override
  String get cardNumber {
    _$cardNumberAtom.context.enforceReadPolicy(_$cardNumberAtom);
    _$cardNumberAtom.reportObserved();
    return super.cardNumber;
  }

  @override
  set cardNumber(String value) {
    _$cardNumberAtom.context.conditionallyRunInAction(() {
      super.cardNumber = value;
      _$cardNumberAtom.reportChanged();
    }, _$cardNumberAtom, name: '${_$cardNumberAtom.name}_set');
  }

  final _$cardNameAtom = Atom(name: '_TransactionOnlineBase.cardName');

  @override
  String get cardName {
    _$cardNameAtom.context.enforceReadPolicy(_$cardNameAtom);
    _$cardNameAtom.reportObserved();
    return super.cardName;
  }

  @override
  set cardName(String value) {
    _$cardNameAtom.context.conditionallyRunInAction(() {
      super.cardName = value;
      _$cardNameAtom.reportChanged();
    }, _$cardNameAtom, name: '${_$cardNameAtom.name}_set');
  }

  final _$cardCVVAtom = Atom(name: '_TransactionOnlineBase.cardCVV');

  @override
  String get cardCVV {
    _$cardCVVAtom.context.enforceReadPolicy(_$cardCVVAtom);
    _$cardCVVAtom.reportObserved();
    return super.cardCVV;
  }

  @override
  set cardCVV(String value) {
    _$cardCVVAtom.context.conditionallyRunInAction(() {
      super.cardCVV = value;
      _$cardCVVAtom.reportChanged();
    }, _$cardCVVAtom, name: '${_$cardCVVAtom.name}_set');
  }

  final _$cardDateExpirationAtom =
      Atom(name: '_TransactionOnlineBase.cardDateExpiration');

  @override
  String get cardDateExpiration {
    _$cardDateExpirationAtom.context
        .enforceReadPolicy(_$cardDateExpirationAtom);
    _$cardDateExpirationAtom.reportObserved();
    return super.cardDateExpiration;
  }

  @override
  set cardDateExpiration(String value) {
    _$cardDateExpirationAtom.context.conditionallyRunInAction(() {
      super.cardDateExpiration = value;
      _$cardDateExpirationAtom.reportChanged();
    }, _$cardDateExpirationAtom, name: '${_$cardDateExpirationAtom.name}_set');
  }

  final _$_TransactionOnlineBaseActionController =
      ActionController(name: '_TransactionOnlineBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDocument(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setDocument(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDdd(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setDdd(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelephone(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setTelephone(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(int valueBillet) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setValue(valueBillet);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDateExpiration(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setDateExpiration(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstallments(int value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setInstallments(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCardNumber(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setCardNumber(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCardName(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setCardName(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCardCVV(String value) {
    final _$actionInfo = _$_TransactionOnlineBaseActionController.startAction();
    try {
      return super.setCardCVV(value);
    } finally {
      _$_TransactionOnlineBaseActionController.endAction(_$actionInfo);
    }
  }
}
