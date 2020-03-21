// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Estado on _EstadoBase, Store {
  final _$nomeAtom = Atom(name: '_EstadoBase.nome');

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

  final _$ufAtom = Atom(name: '_EstadoBase.uf');

  @override
  String get uf {
    _$ufAtom.context.enforceReadPolicy(_$ufAtom);
    _$ufAtom.reportObserved();
    return super.uf;
  }

  @override
  set uf(String value) {
    _$ufAtom.context.conditionallyRunInAction(() {
      super.uf = value;
      _$ufAtom.reportChanged();
    }, _$ufAtom, name: '${_$ufAtom.name}_set');
  }

  final _$paisAtom = Atom(name: '_EstadoBase.pais');

  @override
  Pais get pais {
    _$paisAtom.context.enforceReadPolicy(_$paisAtom);
    _$paisAtom.reportObserved();
    return super.pais;
  }

  @override
  set pais(Pais value) {
    _$paisAtom.context.conditionallyRunInAction(() {
      super.pais = value;
      _$paisAtom.reportChanged();
    }, _$paisAtom, name: '${_$paisAtom.name}_set');
  }

  final _$_EstadoBaseActionController = ActionController(name: '_EstadoBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_EstadoBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_EstadoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUf(String value) {
    final _$actionInfo = _$_EstadoBaseActionController.startAction();
    try {
      return super.setUf(value);
    } finally {
      _$_EstadoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPais(Pais value) {
    final _$actionInfo = _$_EstadoBaseActionController.startAction();
    try {
      return super.setPais(value);
    } finally {
      _$_EstadoBaseActionController.endAction(_$actionInfo);
    }
  }
}
