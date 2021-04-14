import 'dart:convert';
import 'dart:io';
import 'package:cloud_crm/src/dto/login_dto.dart';
import 'package:cloud_crm/src/dto/login_payload_dto.dart';
import 'package:cloud_crm/src/external_services/login_external.dart';
import 'package:cloud_crm/src/models/company.dart';
import 'package:cloud_crm/src/models/user.dart';
import 'package:cloud_crm/src/services/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class AuthService extends Service {
  LoginExternal _loginExternal;

  AuthService(this._loginExternal);

  Future<LoginPayloadDto> login(LoginDto login) async {
    try {
      LoginPayloadDto loginPayloadDto = await this._loginExternal.login(login);
      await _saveCompany(loginPayloadDto.company);
      await _saveUser(loginPayloadDto.user);
      return loginPayloadDto;
    } catch (e) {
      rethrow;
    }
  }

  _saveCompany(Company company) async {
    _saveLocalImage(company.logo);
    company.setDados(jsonEncode(company.toJson()));
    company.idLocal = 0;
    company.statusSync = 0;
    Company aux = await getCompanyById(company.idRemote, "idRemote", "company");
    if (aux.idLocal != 0) {
      company.idLocal = aux.idLocal;
    }
    await saveOrUpdate(company.asEntity());
  }

  _saveUser(User user) async {
    _saveLocalImage(user.foto);
    user.setDados(jsonEncode(user.toMap()));
    user.idLocal = 0;
    user.statusSync = 0;
    await saveOrUpdate(user.asEntity());
  }

  _saveLocalImage(String url) async {
    String directory = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$directory/companyLogo.png');

    if (url.isNotEmpty && !file.existsSync()) {
      var response = await http.get(url);
      var bytes = response.bodyBytes;
      await file.writeAsBytes(bytes);
    }
  }

  Future<bool> autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jwt = prefs.getString('token');
    if (jwt == null) {
      return false;
    }
    return true;
  }

  static Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return false;
  }

  static Future<String> checkIfUserIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jwt = prefs.getString('token');
    if (jwt == null) {
      return "";
    }
    return jwt;
  }

  Future<Company> getCompanyById(
      int id, String idName, String tableName) async {
    List<Map> maps = await super.dao().getById(id, idName, tableName);
    Company company = Company();
    company.idLocal = 0;
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        company.idLocal = maps[i]["idLocal"];
      }
    }
    return company;
  }
}