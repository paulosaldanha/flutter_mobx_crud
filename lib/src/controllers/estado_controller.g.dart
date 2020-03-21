// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstadoController on _EstadoController, Store {
  Computed<List<Pais>> _$listFilteredPaisComputed;

  @override
  List<Pais> get listFilteredPais => (_$listFilteredPaisComputed ??=
          Computed<List<Pais>>(() => super.listFilteredPais))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;
  Computed<List<Estado>> _$listFilteredComputed;

  @override
  List<Estado> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Estado>>(() => super.listFiltered))
      .value;

  final _$nomePaisAtom = Atom(name: '_EstadoController.nomePais');

  @override
  String get nomePais {
    _$nomePaisAtom.context.enforceReadPolicy(_$nomePaisAtom);
    _$nomePaisAtom.reportObserved();
    return super.nomePais;
  }

  @override
  set nomePais(String value) {
    _$nomePaisAtom.context.conditionallyRunInAction(() {
      super.nomePais = value;
      _$nomePaisAtom.reportChanged();
    }, _$nomePaisAtom, name: '${_$nomePaisAtom.name}_set');
  }

  final _$patternAtom = Atom(name: '_EstadoController.pattern');

  @override
  String get pattern {
    _$patternAtom.context.enforceReadPolicy(_$patternAtom);
    _$patternAtom.reportObserved();
    return super.pattern;
  }

  @override
  set pattern(String value) {
    _$patternAtom.context.conditionallyRunInAction(() {
      super.pattern = value;
      _$patternAtom.reportChanged();
    }, _$patternAtom, name: '${_$patternAtom.name}_set');
  }

  final _$listPaisAtom = Atom(name: '_EstadoController.listPais');

  @override
  ObservableList<Pais> get listPais {
    _$listPaisAtom.context.enforceReadPolicy(_$listPaisAtom);
    _$listPaisAtom.reportObserved();
    return super.listPais;
  }

  @override
  set listPais(ObservableList<Pais> value) {
    _$listPaisAtom.context.conditionallyRunInAction(() {
      super.listPais = value;
      _$listPaisAtom.reportChanged();
    }, _$listPaisAtom, name: '${_$listPaisAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_EstadoController.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$listEstadoAtom = Atom(name: '_EstadoController.listEstado');

  @override
  ObservableList<Estado> get listEstado {
    _$listEstadoAtom.context.enforceReadPolicy(_$listEstadoAtom);
    _$listEstadoAtom.reportObserved();
    return super.listEstado;
  }

  @override
  set listEstado(ObservableList<Estado> value) {
    _$listEstadoAtom.context.conditionallyRunInAction(() {
      super.listEstado = value;
      _$listEstadoAtom.reportChanged();
    }, _$listEstadoAtom, name: '${_$listEstadoAtom.name}_set');
  }

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future<Estado> add() {
    return _$addAsyncAction.run(() => super.add());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<dynamic> update(Estado model) {
    return _$updateAsyncAction.run(() => super.update(model));
  }

  final _$_EstadoControllerActionController =
      ActionController(name: '_EstadoController');

  @override
  dynamic setNomePais(String value) {
    final _$actionInfo = _$_EstadoControllerActionController.startAction();
    try {
      return super.setNomePais(value);
    } finally {
      _$_EstadoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPattern(String value) {
    final _$actionInfo = _$_EstadoControllerActionController.startAction();
    try {
      return super.setPattern(value);
    } finally {
      _$_EstadoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_EstadoControllerActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_EstadoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItem(Estado model) {
    final _$actionInfo = _$_EstadoControllerActionController.startAction();
    try {
      return super.addItem(model);
    } finally {
      _$_EstadoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(Estado model) {
    final _$actionInfo = _$_EstadoControllerActionController.startAction();
    try {
      return super.removeItem(model);
    } finally {
      _$_EstadoControllerActionController.endAction(_$actionInfo);
    }
  }
}
