// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mpos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionMposController on _TransactionMposController, Store {
  final _$statusAtom = Atom(name: '_TransactionMposController.status');

  @override
  int get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_TransactionMposControllerActionController =
      ActionController(name: '_TransactionMposController');

  @override
  dynamic setDeviceName(int value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setDeviceName(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }
}
