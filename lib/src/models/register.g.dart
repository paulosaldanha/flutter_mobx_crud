// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Register on _Register, Store {
  final _$razaoSocialAtom = Atom(name: '_Register.razaoSocial');

  @override
  String get razaoSocial {
    _$razaoSocialAtom.context.enforceReadPolicy(_$razaoSocialAtom);
    _$razaoSocialAtom.reportObserved();
    return super.razaoSocial;
  }

  @override
  set razaoSocial(String value) {
    _$razaoSocialAtom.context.conditionallyRunInAction(() {
      super.razaoSocial = value;
      _$razaoSocialAtom.reportChanged();
    }, _$razaoSocialAtom, name: '${_$razaoSocialAtom.name}_set');
  }

  final _$cnpjAtom = Atom(name: '_Register.cnpj');

  @override
  String get cnpj {
    _$cnpjAtom.context.enforceReadPolicy(_$cnpjAtom);
    _$cnpjAtom.reportObserved();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.context.conditionallyRunInAction(() {
      super.cnpj = value;
      _$cnpjAtom.reportChanged();
    }, _$cnpjAtom, name: '${_$cnpjAtom.name}_set');
  }

  final _$responsavelEmailAtom = Atom(name: '_Register.responsavelEmail');

  @override
  String get responsavelEmail {
    _$responsavelEmailAtom.context.enforceReadPolicy(_$responsavelEmailAtom);
    _$responsavelEmailAtom.reportObserved();
    return super.responsavelEmail;
  }

  @override
  set responsavelEmail(String value) {
    _$responsavelEmailAtom.context.conditionallyRunInAction(() {
      super.responsavelEmail = value;
      _$responsavelEmailAtom.reportChanged();
    }, _$responsavelEmailAtom, name: '${_$responsavelEmailAtom.name}_set');
  }

  final _$responsavelAtom = Atom(name: '_Register.responsavel');

  @override
  String get responsavel {
    _$responsavelAtom.context.enforceReadPolicy(_$responsavelAtom);
    _$responsavelAtom.reportObserved();
    return super.responsavel;
  }

  @override
  set responsavel(String value) {
    _$responsavelAtom.context.conditionallyRunInAction(() {
      super.responsavel = value;
      _$responsavelAtom.reportChanged();
    }, _$responsavelAtom, name: '${_$responsavelAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_Register.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$_RegisterActionController = ActionController(name: '_Register');

  @override
  void setRazaoSocial(String value) {
    final _$actionInfo = _$_RegisterActionController.startAction();
    try {
      return super.setRazaoSocial(value);
    } finally {
      _$_RegisterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setcnpj(String value) {
    final _$actionInfo = _$_RegisterActionController.startAction();
    try {
      return super.setcnpj(value);
    } finally {
      _$_RegisterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResponsavelEmail(String value) {
    final _$actionInfo = _$_RegisterActionController.startAction();
    try {
      return super.setResponsavelEmail(value);
    } finally {
      _$_RegisterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResponsavel(String value) {
    final _$actionInfo = _$_RegisterActionController.startAction();
    try {
      return super.setResponsavel(value);
    } finally {
      _$_RegisterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_RegisterActionController.startAction();
    try {
      return super.setSenha(value);
    } finally {
      _$_RegisterActionController.endAction(_$actionInfo);
    }
  }
}
