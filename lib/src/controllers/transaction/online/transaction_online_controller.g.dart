// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_online_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionOnlineController on _TransactionOnlineController, Store {
  Computed<bool> _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName)).value;
  Computed<bool> _$validCardNameComputed;

  @override
  bool get validCardName =>
      (_$validCardNameComputed ??= Computed<bool>(() => super.validCardName))
          .value;
  Computed<bool> _$validCardNumberComputed;

  @override
  bool get validCardNumber => (_$validCardNumberComputed ??=
          Computed<bool>(() => super.validCardNumber))
      .value;
  Computed<bool> _$validCardDateExpirationComputed;

  @override
  bool get validCardDateExpiration => (_$validCardDateExpirationComputed ??=
          Computed<bool>(() => super.validCardDateExpiration))
      .value;
  Computed<bool> _$validCardCVVComputed;

  @override
  bool get validCardCVV =>
      (_$validCardCVVComputed ??= Computed<bool>(() => super.validCardCVV))
          .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;
  Computed<bool> _$isValidPart3Computed;

  @override
  bool get isValidPart3 =>
      (_$isValidPart3Computed ??= Computed<bool>(() => super.isValidPart3))
          .value;

  final _$userThinkAtom = Atom(name: '_TransactionOnlineController.userThink');

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

  final _$loadingAtom = Atom(name: '_TransactionOnlineController.loading');

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
}
