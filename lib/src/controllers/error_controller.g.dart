// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ErrorController on _ErrorController, Store {
  final _$visibilityAtom = Atom(name: '_ErrorController.visibility');

  @override
  bool get visibility {
    _$visibilityAtom.context.enforceReadPolicy(_$visibilityAtom);
    _$visibilityAtom.reportObserved();
    return super.visibility;
  }

  @override
  set visibility(bool value) {
    _$visibilityAtom.context.conditionallyRunInAction(() {
      super.visibility = value;
      _$visibilityAtom.reportChanged();
    }, _$visibilityAtom, name: '${_$visibilityAtom.name}_set');
  }

  final _$textAtom = Atom(name: '_ErrorController.text');

  @override
  String get text {
    _$textAtom.context.enforceReadPolicy(_$textAtom);
    _$textAtom.reportObserved();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.context.conditionallyRunInAction(() {
      super.text = value;
      _$textAtom.reportChanged();
    }, _$textAtom, name: '${_$textAtom.name}_set');
  }

  final _$_ErrorControllerActionController =
      ActionController(name: '_ErrorController');

  @override
  dynamic setVisibility(bool value) {
    final _$actionInfo = _$_ErrorControllerActionController.startAction();
    try {
      return super.setVisibility(value);
    } finally {
      _$_ErrorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setText(String value) {
    final _$actionInfo = _$_ErrorControllerActionController.startAction();
    try {
      return super.setText(value);
    } finally {
      _$_ErrorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget message(dynamic context) {
    final _$actionInfo = _$_ErrorControllerActionController.startAction();
    try {
      return super.message(context);
    } finally {
      _$_ErrorControllerActionController.endAction(_$actionInfo);
    }
  }
}
