// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_online_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionOnlineController on _TransactionOnlineController, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$patternAtom = Atom(name: '_TransactionOnlineController.pattern');

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

  final _$_TransactionOnlineControllerActionController =
      ActionController(name: '_TransactionOnlineController');

  @override
  dynamic setPattern(String value) {
    final _$actionInfo =
        _$_TransactionOnlineControllerActionController.startAction();
    try {
      return super.setPattern(value);
    } finally {
      _$_TransactionOnlineControllerActionController.endAction(_$actionInfo);
    }
  }
}
