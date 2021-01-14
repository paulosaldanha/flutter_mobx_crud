import 'dart:convert';
import 'dart:io';
import 'package:estruturabasica/src/models/user_thinkdata.dart';
import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:http/http.dart' as http;


Future<UserThinkdata> getUserThinkData(String documento) async {
  String bearerToken = await AuthService().checkIfUserIsLoggedIn();
  var client = http.Client();

  try {
    var response = await client.get(
        'http://ecommercebank.tk/ecommerce/api/thinkdata/$documento',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
        });

    return UserThinkdata.fromMap(jsonDecode(response.body));

  } finally {
    client.close();
  }
}