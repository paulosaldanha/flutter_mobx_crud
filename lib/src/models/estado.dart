import 'package:estruturabasica/src/models/pais.dart';
import 'package:mobx/mobx.dart';

part 'estado.g.dart';

// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class Estado = _EstadoBase with _$Estado;
//Store sinaliza que a classe esta apta a geração de codigo automatica do mobx
abstract class _EstadoBase with Store {
  int id;
  @observable
  String nome;
  @observable
  String uf;
  @observable 
  Pais pais;

  String status;
  String status_sync;
//getter and setter
  @action
  setNome(String value) => nome = value;

  @action 
  setUf(String value) => uf = value;

  @action
  setPais(Pais value) => pais = value;

//Constructors

  _EstadoBase.construtorParametro (this.id, this.nome,this.uf,this.pais);

  _EstadoBase (){
    pais = Pais();
  }

//List Functions
  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'id': id,
      'nome': nome,
      'uf': uf,
      'pais_id': pais.id,
      'status': status,
      'status_sync': status_sync
    };
    return map;
  }

  _EstadoBase.fromMap(Map<String,dynamic> map){
    id = map['id'];
    nome = map['nome'];
    uf = map['uf'];
    if(pais == null){
      pais = Pais();
    }
    pais.id = map['pais_id'];
    status = map['status'];
    status_sync = map['status_sync'];
  }
}