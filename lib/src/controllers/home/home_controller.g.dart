// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;

  final _$sizeCardAtom = Atom(name: '_HomeController.sizeCard');

  @override
  double get sizeCard {
    _$sizeCardAtom.context.enforceReadPolicy(_$sizeCardAtom);
    _$sizeCardAtom.reportObserved();
    return super.sizeCard;
  }

  @override
  set sizeCard(double value) {
    _$sizeCardAtom.context.conditionallyRunInAction(() {
      super.sizeCard = value;
      _$sizeCardAtom.reportChanged();
    }, _$sizeCardAtom, name: '${_$sizeCardAtom.name}_set');
  }

  final _$requestAtom = Atom(name: '_HomeController.request');

  @override
  ObservableFuture<TransactionWalletDto> get request {
    _$requestAtom.context.enforceReadPolicy(_$requestAtom);
    _$requestAtom.reportObserved();
    return super.request;
  }

  @override
  set request(ObservableFuture<TransactionWalletDto> value) {
    _$requestAtom.context.conditionallyRunInAction(() {
      super.request = value;
      _$requestAtom.reportChanged();
    }, _$requestAtom, name: '${_$requestAtom.name}_set');
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic setSizeCard() {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.setSizeCard();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }
}
