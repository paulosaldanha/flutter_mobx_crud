// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boleto.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Boleto on _BoletoBase, Store {
  final _$nomeAtom = Atom(name: '_BoletoBase.nome');

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

  final _$emailAtom = Atom(name: '_BoletoBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$documentoAtom = Atom(name: '_BoletoBase.documento');

  @override
  String get documento {
    _$documentoAtom.context.enforceReadPolicy(_$documentoAtom);
    _$documentoAtom.reportObserved();
    return super.documento;
  }

  @override
  set documento(String value) {
    _$documentoAtom.context.conditionallyRunInAction(() {
      super.documento = value;
      _$documentoAtom.reportChanged();
    }, _$documentoAtom, name: '${_$documentoAtom.name}_set');
  }

  final _$dddAtom = Atom(name: '_BoletoBase.ddd');

  @override
  String get ddd {
    _$dddAtom.context.enforceReadPolicy(_$dddAtom);
    _$dddAtom.reportObserved();
    return super.ddd;
  }

  @override
  set ddd(String value) {
    _$dddAtom.context.conditionallyRunInAction(() {
      super.ddd = value;
      _$dddAtom.reportChanged();
    }, _$dddAtom, name: '${_$dddAtom.name}_set');
  }

  final _$telefoneAtom = Atom(name: '_BoletoBase.telefone');

  @override
  String get telefone {
    _$telefoneAtom.context.enforceReadPolicy(_$telefoneAtom);
    _$telefoneAtom.reportObserved();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.context.conditionallyRunInAction(() {
      super.telefone = value;
      _$telefoneAtom.reportChanged();
    }, _$telefoneAtom, name: '${_$telefoneAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_BoletoBase.valor');

  @override
  double get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$vencimentoAtom = Atom(name: '_BoletoBase.vencimento');

  @override
  DateTime get vencimento {
    _$vencimentoAtom.context.enforceReadPolicy(_$vencimentoAtom);
    _$vencimentoAtom.reportObserved();
    return super.vencimento;
  }

  @override
  set vencimento(DateTime value) {
    _$vencimentoAtom.context.conditionallyRunInAction(() {
      super.vencimento = value;
      _$vencimentoAtom.reportChanged();
    }, _$vencimentoAtom, name: '${_$vencimentoAtom.name}_set');
  }

  final _$_BoletoBaseActionController = ActionController(name: '_BoletoBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDocumento(String value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setDocumento(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDdd(String value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setDdd(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelefone(String value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setTelefone(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValor(String value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setValor(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVencimento(DateTime value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setVencimento(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMensagem(String value) {
    final _$actionInfo = _$_BoletoBaseActionController.startAction();
    try {
      return super.setMensagem(value);
    } finally {
      _$_BoletoBaseActionController.endAction(_$actionInfo);
    }
  }
}
