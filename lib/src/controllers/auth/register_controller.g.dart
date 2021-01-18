// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
  Computed<bool> _$validDocumentComputed;

  @override
  bool get validDocument =>
      (_$validDocumentComputed ??= Computed<bool>(() => super.validDocument))
          .value;
  Computed<bool> _$validCompanyNameComputed;

  @override
  bool get validCompanyName => (_$validCompanyNameComputed ??=
          Computed<bool>(() => super.validCompanyName))
      .value;
  Computed<bool> _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName)).value;
  Computed<bool> _$validCepComputed;

  @override
  bool get validCep =>
      (_$validCepComputed ??= Computed<bool>(() => super.validCep)).value;
  Computed<bool> _$validRuaComputed;

  @override
  bool get validRua =>
      (_$validRuaComputed ??= Computed<bool>(() => super.validRua)).value;
  Computed<bool> _$validNumeroComputed;

  @override
  bool get validNumero =>
      (_$validNumeroComputed ??= Computed<bool>(() => super.validNumero)).value;
  Computed<bool> _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail)).value;
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

  final _$confirmPasswordAtom =
      Atom(name: '_RegisterController.confirmPassword');

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
      Atom(name: '_RegisterController.passwordVisible');

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
      Atom(name: '_RegisterController.confirmPasswordVisible');

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

  final _$loadingAtom = Atom(name: '_RegisterController.loading');

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

  final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController');

  @override
  dynamic setConfirmPassword(dynamic value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction();
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic visibilityPassword() {
    final _$actionInfo = _$_RegisterControllerActionController.startAction();
    try {
      return super.visibilityPassword();
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic visibilityConfirmPassword() {
    final _$actionInfo = _$_RegisterControllerActionController.startAction();
    try {
      return super.visibilityConfirmPassword();
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }
}
