import 'package:estruturabasica/src/services/pais_service.dart';
import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/pais.dart';
//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'pais_controller.g.dart';

class PaisController = _PaisController with _$PaisController;

abstract class _PaisController with Store {

  _PaisController();

  //referente ao formulario de inserção
  var pais = Pais();
  var service = PaisService();
  //validador de nome
  String validateNome(){
    if(pais.nome == null || pais.nome.isEmpty){
      return "Campo obrigatório";
    }
    return null;
  }
  //validador de ddi
  String validateDdi(){
    if(pais.ddi != null && pais.ddi.length >= 6){
      return "Campo não pode ser maior que 5 caracteres";
    } 
    return null;
  }
  //validador de sigla
  String validateSigla(){
    if(pais.sigla != null && pais.sigla.length > 3){
      return "Campo não pode ser maior que 3 caracteres";
    } 
    return null;
  }
  // dados computados, dados derivados de estado(reatividade) existente ou de outros dados computados
   @computed
  bool get isValid {
    return validateNome() == null && validateDdi() == null && validateSigla() == null;
  }

  //referente a listagem
  //string do filtro (palavra) digitada na lista, campo observavel
  @observable
  String filter = '';
  //set do filter, ação do campo observavel, toda vez que modificado, muda seu estado, chama a action
  @action
  setFilter(String value) => filter = value;

  //dados filtrados da lista, carrega a lista com todos ou somente com o criterio do filtro
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
  //Lista observavel
  @observable
  ObservableList<Pais> listPais;

  carregaPais() async {
    //Assim seto valor na lista observavel
    listPais = ObservableList<Pais>.of(await service.getListaPais());
  }
  @action
  addItem(Pais model){
    listPais.add(model);
    service.saveOrUpdate(model);
    
  }
  //acão do botao remover da lista, botao é observavel na lista widget
  @action
  removeItem(Pais model){
    listPais.removeWhere((pais) => pais.id == model.id);
    //service.delete(model.id);
    model.status = 'I';
    service.saveOrUpdate(model);
  }

  //ação do botao salvar/atualizar
  @action
  Future<Pais> add() async {
    // Pais paisretorno;
    // if(pais.id == null || pais.id == 0){
    //   pais.status = 'A';
    //   paisretorno = await service.add(pais);
    // }else{
    //   int idpais = await service.update(pais);
    //   paisretorno = pais;
    // }
    pais = await service.saveOrUpdate(pais);
    await carregaPais();
    listPais.add(pais);
    return pais;
  }

  //ação do botao atualizar
  @action
  Future update(Pais model) async {
    pais = await service.saveOrUpdate(model);
    await carregaPais();
    listPais.add(model);
  }
  
}