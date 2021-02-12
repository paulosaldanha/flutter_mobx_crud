// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountController on _AccountController, Store {
  Computed<bool> _$isLoadingRequestComputed;

  @override
  bool get isLoadingRequest => (_$isLoadingRequestComputed ??=
          Computed<bool>(() => super.isLoadingRequest))
      .value;
  Computed<bool> _$validPasswordComputed;

  @override
  bool get validPassword =>
      (_$validPasswordComputed ??= Computed<bool>(() => super.validPassword))
          .value;
  Computed<bool> _$validoldPasswordComputed;

  @override
  bool get validoldPassword => (_$validoldPasswordComputed ??=
          Computed<bool>(() => super.validoldPassword))
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

  final _$oldPasswordAtom = Atom(name: '_AccountController.oldPassword');

  @override
  String get oldPassword {
    _$oldPasswordAtom.context.enforceReadPolicy(_$oldPasswordAtom);
    _$oldPasswordAtom.reportObserved();
    return super.oldPassword;
  }

  @override
  set oldPassword(String value) {
    _$oldPasswordAtom.context.conditionallyRunInAction(() {
      super.oldPassword = value;
      _$oldPasswordAtom.reportChanged();
    }, _$oldPasswordAtom, name: '${_$oldPasswordAtom.name}_set');
  }

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

  final _$isChangePasswordAtom =
      Atom(name: '_AccountController.isChangePassword');

  @override
  bool get isChangePassword {
    _$isChangePasswordAtom.context.enforceReadPolicy(_$isChangePasswordAtom);
    _$isChangePasswordAtom.reportObserved();
    return super.isChangePassword;
  }

  @override
  set isChangePassword(bool value) {
    _$isChangePasswordAtom.context.conditionallyRunInAction(() {
      super.isChangePassword = value;
      _$isChangePasswordAtom.reportChanged();
    }, _$isChangePasswordAtom, name: '${_$isChangePasswordAtom.name}_set');
  }

  final _$requestAtom = Atom(name: '_AccountController.request');

  @override
  ObservableFuture<PasswordDto> get request {
    _$requestAtom.context.enforceReadPolicy(_$requestAtom);
    _$requestAtom.reportObserved();
    return super.request;
  }

  @override
  set request(ObservableFuture<PasswordDto> value) {
    _$requestAtom.context.conditionallyRunInAction(() {
      super.request = value;
      _$requestAtom.reportChanged();
    }, _$requestAtom, name: '${_$requestAtom.name}_set');
  }

  final _$_AccountControllerActionController =
      ActionController(name: '_AccountController');

  @override
  dynamic setIsChangePassword() {
    final _$actionInfo = _$_AccountControllerActionController.startAction();
    try {
      return super.setIsChangePassword();
    } finally {
      _$_AccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOldPassword(String value) {
    final _$actionInfo = _$_AccountControllerActionController.startAction();
    try {
      return super.setOldPassword(value);
    } finally {
      _$_AccountControllerActionController.endAction(_$actionInfo);
    }
  }

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
