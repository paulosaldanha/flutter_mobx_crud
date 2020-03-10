// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pais.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Pais on _PaisBase, Store {
  final _$nomeAtom = Atom(name: '_PaisBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$ddiAtom = Atom(name: '_PaisBase.ddi');

  @override
  String get ddi {
    _$ddiAtom.context.enforceReadPolicy(_$ddiAtom);
    _$ddiAtom.reportObserved();
    return super.ddi;
  }

  @override
  set ddi(String value) {
    _$ddiAtom.context.conditionallyRunInAction(() {
      super.ddi = value;
      _$ddiAtom.reportChanged();
    }, _$ddiAtom, name: '${_$ddiAtom.name}_set');
  }

  final _$siglaAtom = Atom(name: '_PaisBase.sigla');

  @override
  String get sigla {
    _$siglaAtom.context.enforceReadPolicy(_$siglaAtom);
    _$siglaAtom.reportObserved();
    return super.sigla;
  }

  @override
  set sigla(String value) {
    _$siglaAtom.context.conditionallyRunInAction(() {
      super.sigla = value;
      _$siglaAtom.reportChanged();
    }, _$siglaAtom, name: '${_$siglaAtom.name}_set');
  }

  final _$_PaisBaseActionController = ActionController(name: '_PaisBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_PaisBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_PaisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDdi(String value) {
    final _$actionInfo = _$_PaisBaseActionController.startAction();
    try {
      return super.setDdi(value);
    } finally {
      _$_PaisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSigla(String value) {
    final _$actionInfo = _$_PaisBaseActionController.startAction();
    try {
      return super.setSigla(value);
    } finally {
      _$_PaisBaseActionController.endAction(_$actionInfo);
    }
  }
}
