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

  final _$titleStatusAtom =
      Atom(name: '_TransactionMposController.titleStatus');

  @override
  String get titleStatus {
    _$titleStatusAtom.context.enforceReadPolicy(_$titleStatusAtom);
    _$titleStatusAtom.reportObserved();
    return super.titleStatus;
  }

  @override
  set titleStatus(String value) {
    _$titleStatusAtom.context.conditionallyRunInAction(() {
      super.titleStatus = value;
      _$titleStatusAtom.reportChanged();
    }, _$titleStatusAtom, name: '${_$titleStatusAtom.name}_set');
  }

  final _$imgStatusAtom = Atom(name: '_TransactionMposController.imgStatus');

  @override
  String get imgStatus {
    _$imgStatusAtom.context.enforceReadPolicy(_$imgStatusAtom);
    _$imgStatusAtom.reportObserved();
    return super.imgStatus;
  }

  @override
  set imgStatus(String value) {
    _$imgStatusAtom.context.conditionallyRunInAction(() {
      super.imgStatus = value;
      _$imgStatusAtom.reportChanged();
    }, _$imgStatusAtom, name: '${_$imgStatusAtom.name}_set');
  }

  final _$_TransactionMposControllerActionController =
      ActionController(name: '_TransactionMposController');

  @override
  dynamic setStatus(int value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitleStatus(String value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setTitleStatus(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImgStatus(String value) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.setImgStatus(value);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic endModal(dynamic context) {
    final _$actionInfo =
        _$_TransactionMposControllerActionController.startAction();
    try {
      return super.endModal(context);
    } finally {
      _$_TransactionMposControllerActionController.endAction(_$actionInfo);
    }
  }
}
