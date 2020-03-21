import 'package:estruturabasica/src/models/pais.dart';
import 'package:estruturabasica/src/services/estado_service.dart';
import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/estado.dart';
import 'package:estruturabasica/src/services/pais_service.dart';
//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'estado_controller.g.dart';

class EstadoController = _EstadoController with _$EstadoController;

abstract class _EstadoController with Store {

  _EstadoController(){
    //setPaisList();
  }

  //referente ao formulario de inserção
  var estado = Estado();
  var service = EstadoService();
  var paisService = PaisService();

  //referente ao autocompletar do pais
  //nome do pais
  @observable
  String nomePais = '';
  @action
  setNomePais(String value) => nomePais = value;
  //string do filtro (palavra) digitada na lista, campo observavel
  @observable
  String pattern = '';
  //set do filter, ação do campo observavel, toda vez que modificado, muda seu estado, chama a action
  @action
  setPattern(String value) => pattern = value;

  //dados filtrados da lista, carrega a lista com todos ou somente com o criterio do filtro
  @computed
  List<Pais> get listFilteredPais {
    if(pattern.isEmpty){
      carregaPais();
      //return service.getAll().asObservable();
      return listPais;
    } else {
      return listPais.where((pais) => pais.nome.toLowerCase().contains(pattern.toLowerCase())).toList();
    }
  }
  //Lista observavel
  @observable
  ObservableList<Pais> listPais;

  carregaPais() async {
    //Assim seto valor na lista observavel
    listPais = ObservableList<Pais>.of(await service.getListaPais());
  }
  //end lista pais
  //carrega pais no estado
  setPais(int id) async{
     Pais pais = await paisService.getById(id);
     estado.setPais(pais);
  }
  //validador de nome
  String validateNome(){
    if(estado.nome == null || estado.nome.isEmpty){
      return "Campo obrigatório";
    }
    return null;
  }
  //validador de ddi
  String validateUf(){
    if(estado.uf != null && estado.uf.length >= 4){
      return "Campo não pode ser maior que 4 caracteres";
    } 
    return null;
  }
  //validador de sigla
  String validatePaisId(){
    if(estado.pais == null || estado.pais.id == null || estado.pais.id <= 0){
      return "Campo Pais obrigatório";
    } 
    return null;
  }
  // dados computados, dados derivados de estado(reatividade) existente ou de outros dados computados
   @computed
  bool get isValid {
    return validateNome() == null && validateUf() == null && validatePaisId() == null;
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
  List<Estado> get listFiltered {
    if(filter.isEmpty){
      carregaEstado();
      //return service.getAll().asObservable();
      return listEstado;
    } else {
      return listEstado.where((estado) => estado.nome.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  }
  //Lista observavel
  @observable
  ObservableList<Estado> listEstado;

  carregaEstado() async {
    //Assim seto valor na lista observavel
    listEstado = ObservableList<Estado>.of(await service.getListaEstado());
  }
  @action
  addItem(Estado model){
    listEstado.add(model);
    service.saveOrUpdate(model);
    
  }
  //acão do botao remover da lista, botao é observavel na lista widget
  @action
  removeItem(Estado model){
    listEstado.removeWhere((estado) => estado.id == model.id);
    //service.delete(model.id);
    model.status = 'I';
    service.saveOrUpdate(model);
  }

  //ação do botao salvar/atualizar
  @action
  Future<Estado> add() async {
    // Estado estadoretorno;
    // if(estado.id == null || estado.id == 0){
    //   estado.status = 'A';
    //   estadoretorno = await service.add(estado);
    // }else{
    //   int idestado = await service.update(estado);
    //   estadoretorno = estado;
    // }
    estado = await service.saveOrUpdate(estado);
    await carregaEstado();
    listEstado.add(estado);
    return estado;
  }

  //ação do botao atualizar
  @action
  Future update(Estado model) async {
    estado = await service.saveOrUpdate(model);
    await carregaEstado();
    listEstado.add(model);
  }
  
}