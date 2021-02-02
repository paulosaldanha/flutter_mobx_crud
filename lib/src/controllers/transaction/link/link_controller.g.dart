// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LinkController on _LinkController, Store {
  Computed<bool> _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName)).value;
  Computed<bool> _$validDateExpirationComputed;

  @override
  bool get validDateExpiration => (_$validDateExpirationComputed ??=
          Computed<bool>(() => super.validDateExpiration))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$validDateAtom = Atom(name: '_LinkController.validDate');

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

  final _$isLoadingAtom = Atom(name: '_LinkController.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$requestLinkAtom = Atom(name: '_LinkController.requestLink');

  @override
  ObservableFuture<TransactionLinkDto> get requestLink {
    _$requestLinkAtom.context.enforceReadPolicy(_$requestLinkAtom);
    _$requestLinkAtom.reportObserved();
    return super.requestLink;
  }

  @override
  set requestLink(ObservableFuture<TransactionLinkDto> value) {
    _$requestLinkAtom.context.conditionallyRunInAction(() {
      super.requestLink = value;
      _$requestLinkAtom.reportChanged();
    }, _$requestLinkAtom, name: '${_$requestLinkAtom.name}_set');
  }

  final _$_LinkControllerActionController =
      ActionController(name: '_LinkController');

  @override
  dynamic setValidDate(String value) {
    final _$actionInfo = _$_LinkControllerActionController.startAction();
    try {
      return super.setValidDate(value);
    } finally {
      _$_LinkControllerActionController.endAction(_$actionInfo);
    }
  }
}
