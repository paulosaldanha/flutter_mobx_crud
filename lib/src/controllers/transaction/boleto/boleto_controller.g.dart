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

  final _$loadingAtom = Atom(name: '_BoletoController.loading');

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

  final _$userThinkAtom = Atom(name: '_BoletoController.userThink');

  @override
  UserThinkdata get userThink {
    _$userThinkAtom.context.enforceReadPolicy(_$userThinkAtom);
    _$userThinkAtom.reportObserved();
    return super.userThink;
  }

  @override
  set userThink(UserThinkdata value) {
    _$userThinkAtom.context.conditionallyRunInAction(() {
      super.userThink = value;
      _$userThinkAtom.reportChanged();
    }, _$userThinkAtom, name: '${_$userThinkAtom.name}_set');
  }

  final _$_BoletoControllerActionController =
      ActionController(name: '_BoletoController');

  @override
  dynamic setValidDate(dynamic value) {
    final _$actionInfo = _$_BoletoControllerActionController.startAction();
    try {
      return super.setValidDate(value);
    } finally {
      _$_BoletoControllerActionController.endAction(_$actionInfo);
    }
  }
}
