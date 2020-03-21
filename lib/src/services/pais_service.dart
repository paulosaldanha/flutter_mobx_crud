
import 'package:estruturabasica/src/models/pais.dart';
import 'package:estruturabasica/src/repository/pais_repository.dart';

class PaisService {
  var _repository;

  PaisService(){
    _repository = PaisRepository();

  }

  Future<Pais> saveOrUpdate(Pais pais) async {
    Pais paisretorno;
    if(pais.id == null || pais.id == 0){
      pais.status = 'A';
      paisretorno = await _repository.add(pais);
    }else{
      int idpais = await _repository.update(pais);
      paisretorno = pais;
      paisretorno.id = idpais;
    }
    return paisretorno;
  }

  String delete(int id){
    _repository.delete(id);
    return "Deletado com sucesso";
  }

  Future<List<Pais>> getListaPais() async {
    
    return await _repository.getListaPais();
  }

  Future<Pais> getById(int id) async {  
    return await _repository.getById(id);
  }

  void close(){
    _repository.close();
  }

}