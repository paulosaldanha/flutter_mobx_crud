import 'package:mobx/mobx.dart';

part 'pais.g.dart';

class Pais = _PaisBase with _$Pais;

abstract class _PaisBase with Store {
  int id;
  @observable
  String nome;
  @observable
  String ddi;
  @observable 
  String sigla;

  String status;
  String status_sync;
//getter and setter
  @action
  setNome(String value) => nome = value;

  @action 
  setDdi(String value) => ddi = value;

  @action
  setSigla(String value) => sigla = value;

//Constructors

  _PaisBase.construtorParametro (this.id, this.nome,this.ddi,this.sigla);

  _PaisBase ();

//List Functions
  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'id': id,
      'nome': nome,
      'ddi': ddi,
      'sigla': sigla,
      'status': status,
      'status_sync': status_sync
    };
    return map;
  }

  _PaisBase.fromMap(Map<String,dynamic> map){
    id = map['id'];
    nome = map['nome'];
    ddi = map['ddi'];
    sigla = map['sigla'];
    status = map['status'];
    status_sync = map['status_sync'];
  }
}