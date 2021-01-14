import 'package:mobx/mobx.dart';

part 'user_thinkdata.g.dart';

class UserThinkdata = _UserThinkdata with _$UserThinkdata;
abstract class _UserThinkdata with Store{

  @observable
  String name;
  @observable
  String phone;
  @observable
  String ddd;
  @observable
  String email;

  _UserThinkdata.fromMap(Map<String, dynamic> map) {
    var userThinkcpf = map["cpfResponse"] != null ? map["cpfResponse"]["validaFacil"]??"":null;
    var userThinkcnpj= map["cnpjResponse"] != null ? map["cnpjResponse"]["validaFacil"]??"":null;
    if(userThinkcpf != null){
      email = userThinkcpf["emails"]??"";
      name = userThinkcpf["dadosCadastrais"] == null ? "" : userThinkcpf["dadosCadastrais"]["dc_Nome"]??"";
      phone = userThinkcpf["moveis"] == null ? "" : userThinkcpf["moveis"]["Cd_DDD"]??"";
      ddd = userThinkcpf["moveis"] == null ? "" : userThinkcpf["moveis"]["Cd_Fone"]??"";
    }else{
        name = userThinkcnpj['dadosCadastrais']['dc_Razao']??"";
    }

  }
}
