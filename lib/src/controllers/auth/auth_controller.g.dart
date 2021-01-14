// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthController, Store {
  final _$loadingAtom = Atom(name: '_AuthController.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$isLoggedAtom = Atom(name: '_AuthController.isLogged');

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

  final _$authAtom = Atom(name: '_AuthController.auth');

  @override
  Auth get auth {
    _$authAtom.context.enforceReadPolicy(_$authAtom);
    _$authAtom.reportObserved();
    return super.auth;
  }

  @override
  set auth(Auth value) {
    _$authAtom.context.conditionallyRunInAction(() {
      super.auth = value;
      _$authAtom.reportChanged();
    }, _$authAtom, name: '${_$authAtom.name}_set');
  }

  final _$checkIfIsLoggedAsyncAction = AsyncAction('checkIfIsLogged');

  @override
  Future<bool> checkIfIsLogged() {
    return _$checkIfIsLoggedAsyncAction.run(() => super.checkIfIsLogged());
  }
}
