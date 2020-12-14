// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boleto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoletoController on _BoletoController, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$patternAtom = Atom(name: '_BoletoController.pattern');

  @override
  String get pattern {
    _$patternAtom.context.enforceReadPolicy(_$patternAtom);
    _$patternAtom.reportObserved();
    return super.pattern;
  }

  @override
  set pattern(String value) {
    _$patternAtom.context.conditionallyRunInAction(() {
      super.pattern = value;
      _$patternAtom.reportChanged();
    }, _$patternAtom, name: '${_$patternAtom.name}_set');
  }

  final _$_BoletoControllerActionController =
      ActionController(name: '_BoletoController');

  @override
  dynamic setPattern(String value) {
    final _$actionInfo = _$_BoletoControllerActionController.startAction();
    try {
      return super.setPattern(value);
    } finally {
      _$_BoletoControllerActionController.endAction(_$actionInfo);
    }
  }
}
