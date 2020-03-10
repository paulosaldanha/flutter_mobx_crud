// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pais_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaisController on _PaisController, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;
  Computed<List<Pais>> _$listFilteredComputed;

  @override
  List<Pais> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Pais>>(() => super.listFiltered))
      .value;

  final _$filterAtom = Atom(name: '_PaisController.filter');

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

  final _$listPaisAtom = Atom(name: '_PaisController.listPais');

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

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future<Pais> add() {
    return _$addAsyncAction.run(() => super.add());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<dynamic> update(Pais model) {
    return _$updateAsyncAction.run(() => super.update(model));
  }

  final _$_PaisControllerActionController =
      ActionController(name: '_PaisController');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_PaisControllerActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_PaisControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItem(Pais model) {
    final _$actionInfo = _$_PaisControllerActionController.startAction();
    try {
      return super.addItem(model);
    } finally {
      _$_PaisControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(Pais model) {
    final _$actionInfo = _$_PaisControllerActionController.startAction();
    try {
      return super.removeItem(model);
    } finally {
      _$_PaisControllerActionController.endAction(_$actionInfo);
    }
  }
}
