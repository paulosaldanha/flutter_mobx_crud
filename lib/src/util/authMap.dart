import 'package:ecommerceBankPay/src/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMap {
  static setAuthMap(Auth auth) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('authUserId', auth.userId);
    prefs.setInt('authCompanyId', auth.companyId);
    prefs.setString('authNameCompany', auth.nameCompany);
    prefs.setString('authUserName', auth.name);
    prefs.setString('authUserEmail', auth.email);
    prefs.setString('urlLogo', auth.companyLogo);
  }

  static Future<Auth> getAuthMap() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Auth auth = Auth();
    auth.name = prefs.getString('authUserName');
    auth.email = prefs.getString('authUserEmail');
    auth.nameCompany = prefs.getString('authNameCompany');
    auth.companyId = prefs.getInt('authCompanyId');
    auth.userId = prefs.getInt('authUserId');
    auth.companyLogo = prefs.getString('urlLogo');
    return auth;
  }
}
