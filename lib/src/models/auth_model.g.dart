// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Auth on _AuthBase, Store {
  final _$emailAtom = Atom(name: '_AuthBase.email');

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

  final _$passwordAtom = Atom(name: '_AuthBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$isLoggedAtom = Atom(name: '_AuthBase.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.context.enforceReadPolicy(_$isLoggedAtom);
    _$isLoggedAtom.reportObserved();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.context.conditionallyRunInAction(() {
      super.isLogged = value;
      _$isLoggedAtom.reportChanged();
    }, _$isLoggedAtom, name: '${_$isLoggedAtom.name}_set');
  }

  final _$errorMsgAtom = Atom(name: '_AuthBase.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.context.enforceReadPolicy(_$errorMsgAtom);
    _$errorMsgAtom.reportObserved();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.context.conditionallyRunInAction(() {
      super.errorMsg = value;
      _$errorMsgAtom.reportChanged();
    }, _$errorMsgAtom, name: '${_$errorMsgAtom.name}_set');
  }

  final _$_AuthBaseActionController = ActionController(name: '_AuthBase');

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_AuthBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_AuthBaseActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLogged(bool value) {
    final _$actionInfo = _$_AuthBaseActionController.startAction();
    try {
      return super.setIsLogged(value);
    } finally {
      _$_AuthBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic seterrorMsg(String value) {
    final _$actionInfo = _$_AuthBaseActionController.startAction();
    try {
      return super.seterrorMsg(value);
    } finally {
      _$_AuthBaseActionController.endAction(_$actionInfo);
    }
  }
}
