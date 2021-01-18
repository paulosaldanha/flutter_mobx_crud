import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

dynamic recoverPassword(email) async {
  var client = http.Client();

  Map<String, Object> payload = Map();
  payload["email"] = email;

  try {
    var response = await client.post(
        'https://ecommercebank.tk/ecommerce/api/Usuario/recoverpassword',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(payload));

    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
}
