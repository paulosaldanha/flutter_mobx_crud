// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
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
