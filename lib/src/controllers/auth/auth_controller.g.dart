// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthController, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

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

  final _$onPressedAtom = Atom(name: '_AuthController.onPressed');

  @override
  dynamic get onPressed {
    _$onPressedAtom.context.enforceReadPolicy(_$onPressedAtom);
    _$onPressedAtom.reportObserved();
    return super.onPressed;
  }

  @override
  set onPressed(dynamic value) {
    _$onPressedAtom.context.conditionallyRunInAction(() {
      super.onPressed = value;
      _$onPressedAtom.reportChanged();
    }, _$onPressedAtom, name: '${_$onPressedAtom.name}_set');
  }

  final _$visibilityBtnAtom = Atom(name: '_AuthController.visibilityBtn');

  @override
  bool get visibilityBtn {
    _$visibilityBtnAtom.context.enforceReadPolicy(_$visibilityBtnAtom);
    _$visibilityBtnAtom.reportObserved();
    return super.visibilityBtn;
  }

  @override
  set visibilityBtn(bool value) {
    _$visibilityBtnAtom.context.conditionallyRunInAction(() {
      super.visibilityBtn = value;
      _$visibilityBtnAtom.reportChanged();
    }, _$visibilityBtnAtom, name: '${_$visibilityBtnAtom.name}_set');
  }

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future<Auth> add() {
    return _$addAsyncAction.run(() => super.add());
  }

  final _$_AuthControllerActionController =
      ActionController(name: '_AuthController');

  @override
  bool setStateLoading(dynamic value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction();
    try {
      return super.setStateLoading(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }
}
