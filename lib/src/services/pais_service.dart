
import 'package:estruturabasica/src/models/pais.dart';
import 'package:estruturabasica/src/repository/pais_repository.dart';

class PaisService {
  var _repository;

  PaisService(){
    _repository = PaisRepository();

  }

  String saveOrUpdate(Pais pais){
    if(pais.id != null && pais.id > 0){
      _repository.update(pais);
    }else{
       _repository.add(pais);
    }
    return "Salvo com sucesso";
  }

  String delete(int id){
    _repository.delete(id);
    return "Deletado com sucesso";
  }

  Future<List<Pais>> getListaPais() async {
    
    return await _repository.getListaPais();
  }

  void close(){
    _repository.close();
  }

}