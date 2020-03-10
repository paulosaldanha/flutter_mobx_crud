import 'package:estruturabasica/src/repository/pais_repository.dart';
import 'package:estruturabasica/src/services/pais_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/pais.dart';

part 'pais_controller.g.dart';

class PaisController = _PaisController with _$PaisController;

abstract class _PaisController with Store {

  _PaisController();

  //referente ao formulario de inserção
  var pais = Pais();
  var service = PaisRepository();

  String validateNome(){
    if(pais.nome == null || pais.nome.isEmpty){
      return "Campo obrigatório";
    }
    return null;
  }

  String validateDdi(){
    if(pais.ddi != null && pais.ddi.length >= 6){
      return "Campo não pode ser maior que 5 caracteres";
    } 
    return null;
  }

  String validateSigla(){
    if(pais.sigla != null && pais.sigla.length > 3){
      return "Campo não pode ser maior que 3 caracteres";
    } 
    return null;
  }

   @computed
  bool get isValid {
    return validateNome() == null && validateDdi() == null && validateSigla() == null;
  }

  //referente a listagem
  //string do filtro (palavra) digitada
  @observable
  String filter = '';
  //set do filter
  @action
  setFilter(String value) => filter = value;

  //dados filtrados da lista
  @computed
  List<Pais> get listFiltered {
    if(filter.isEmpty){
      carregaPais();
      //return service.getAll().asObservable();
      return listPais;
    } else {
      return listPais.where((pais) => pais.nome.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  }

  @observable
  ObservableList<Pais> listPais;

  carregaPais() async {
    listPais = ObservableList<Pais>.of(await service.getListaPais());
  }
  @action
  addItem(Pais model){
    listPais.add(model);
    service.add(model);
    
  }

  @action
  removeItem(Pais model){
    listPais.removeWhere((pais) => pais.id == model.id);
    //service.delete(model.id);
    model.status = 'I';
    service.update(model);
  }

  //ação do botao salvar
  @action
  Future<Pais> add() async {
    Pais paisretorno;
    if(pais.id == null || pais.id == 0){
      pais.status = 'A';
      paisretorno = await service.add(pais);
    }else{
      int idpais = await service.update(pais);
      paisretorno = pais;
    }
    await carregaPais();
    listPais.add(paisretorno);
    return paisretorno;
  }

  //ação do botao atualizar
  @action
  Future update(Pais model) async {
    int idpaisretorno = await service.update(model);
    await carregaPais();
    listPais.add(model);
  }
  
}