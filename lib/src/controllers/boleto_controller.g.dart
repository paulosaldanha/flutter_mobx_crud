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

  final _$validDateAtom = Atom(name: '_BoletoController.validDate');

  @override
  String get validDate {
    _$validDateAtom.context.enforceReadPolicy(_$validDateAtom);
    _$validDateAtom.reportObserved();
    return super.validDate;
  }

  @override
  set validDate(String value) {
    _$validDateAtom.context.conditionallyRunInAction(() {
      super.validDate = value;
      _$validDateAtom.reportChanged();
    }, _$validDateAtom, name: '${_$validDateAtom.name}_set');
  }

  final _$_BoletoControllerActionController =
      ActionController(name: '_BoletoController');

  @override
  dynamic setValidDate(String value) {
    final _$actionInfo = _$_BoletoControllerActionController.startAction();
    try {
      return super.setValidDate(value);
    } finally {
      _$_BoletoControllerActionController.endAction(_$actionInfo);
    }
  }
}
