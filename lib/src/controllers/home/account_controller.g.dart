// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountController on _AccountController, Store {
  Computed<bool> _$validPasswordComputed;

  @override
  bool get validPassword =>
      (_$validPasswordComputed ??= Computed<bool>(() => super.validPassword))
          .value;
  Computed<bool> _$validConfirmPasswordComputed;

  @override
  bool get validConfirmPassword => (_$validConfirmPasswordComputed ??=
          Computed<bool>(() => super.validConfirmPassword))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$passwordAtom = Atom(name: '_AccountController.password');

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

  final _$confirmPasswordAtom =
      Atom(name: '_AccountController.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.context.enforceReadPolicy(_$confirmPasswordAtom);
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context.conditionallyRunInAction(() {
      super.confirmPassword = value;
      _$confirmPasswordAtom.reportChanged();
    }, _$confirmPasswordAtom, name: '${_$confirmPasswordAtom.name}_set');
  }

  final _$passwordVisibleAtom =
      Atom(name: '_AccountController.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.context.enforceReadPolicy(_$passwordVisibleAtom);
    _$passwordVisibleAtom.reportObserved();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.context.conditionallyRunInAction(() {
      super.passwordVisible = value;
      _$passwordVisibleAtom.reportChanged();
    }, _$passwordVisibleAtom, name: '${_$passwordVisibleAtom.name}_set');
  }

  final _$confirmPasswordVisibleAtom =
      Atom(name: '_AccountController.confirmPasswordVisible');

  @override
  bool get confirmPasswordVisible {
    _$confirmPasswordVisibleAtom.context
        .enforceReadPolicy(_$confirmPasswordVisibleAtom);
    _$confirmPasswordVisibleAtom.reportObserved();
    return super.confirmPasswordVisible;
  }

  @override
  set confirmPasswordVisible(bool value) {
    _$confirmPasswordVisibleAtom.context.conditionallyRunInAction(() {
      super.confirmPasswordVisible = value;
      _$confirmPasswordVisibleAtom.reportChanged();
    }, _$confirmPasswordVisibleAtom,
        name: '${_$confirmPasswordVisibleAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_AccountController.loading');

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

  final _$_AccountControllerActionController =
      ActionController(name: '_AccountController');

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_AccountControllerActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_AccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmPassword(String value) {
    final _$actionInfo = _$_AccountControllerActionController.startAction();
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_AccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic visibilityPassword() {
    final _$actionInfo = _$_AccountControllerActionController.startAction();
    try {
      return super.visibilityPassword();
    } finally {
      _$_AccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic visibilityConfirmPassword() {
    final _$actionInfo = _$_AccountControllerActionController.startAction();
    try {
      return super.visibilityConfirmPassword();
    } finally {
      _$_AccountControllerActionController.endAction(_$actionInfo);
    }
  }
}
