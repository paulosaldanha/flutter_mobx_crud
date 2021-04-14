import 'dart:convert';
import 'package:dio/dio.dart';

class PasswordExternal {
  final Dio dio;

  PasswordExternal(this.dio);

  Future<dynamic> recoverPassword(Map email) async {
    try {
      var response =
      await dio.post('/requestpassword', data: jsonEncode(email));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> changePaswword(Map password) async {
    try {
      final response =
      await dio.put('/recoverpassword', data: jsonEncode(password));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}