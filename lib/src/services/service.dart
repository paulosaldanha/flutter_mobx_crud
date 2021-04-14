import 'package:cloud_crm/src/dao/generic_dao.dart';
import 'package:cloud_crm/src/models/entity.dart';

class Service {
  var _dao;

  Service.construtorParametro(GenericDao dao) {
    _dao = dao;
  }

  Service() {
    _dao = GenericDao();
  }

  GenericDao dao() => _dao;

  Future addAll(List<Entity> entities) async {
    await _dao.addAll(entities);
  }

  Future addAllList(List<List<Entity>> entities) async {
    await _dao.addAllList(entities);
  }

  Future<Entity> saveOrUpdate(Entity objeto) async {
    Entity objretorno;

    if (objeto.idLocal == 0) {
      objretorno = await _dao.save(objeto);
    } else {
      await _dao.update(objeto);
      objretorno = objeto;
    }
    return objeto;
  }

  String delete(int id, String tableName) {
    _dao.deleteAll(id, tableName);
    return "Deletado com sucesso";
  }

  void deleteAll(String tableName) async {
    return await _dao.deleteAll(tableName);
  }

  Future<List<Map>> getLista(String tableName) async {
    List<Map> maps = await _dao.getLista(tableName);

    return maps;
  }

  Future<List<Map>> getListaFiltered(String tableName,String whereArgs) async {
    List<Map> maps = await _dao.getListaFiltered(tableName,whereArgs);

    return maps;
  }

  Future<List<Map>> getById(int id, String idName, String tableName) async {
    return await _dao.getById(id, idName, tableName);
  }

  Future<List<Map>> getByIdFromForm(
      int id, String idName, String tableName, String form) async {
    dynamic res = await _dao.getByIdFromForm(id, idName, tableName, form);
    return res;
  }
}