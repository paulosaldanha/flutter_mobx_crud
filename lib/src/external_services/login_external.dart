import 'dart:convert';

import 'package:cloud_crm/src/dto/login_dto.dart';
import 'package:cloud_crm/src/dto/login_payload_dto.dart';
import 'package:dio/dio.dart';

class LoginExternal {
  final Dio dio;

  LoginExternal(this.dio);

  Future<LoginPayloadDto> login(LoginDto login) async {
    try {
      final res = await dio.post('/login', data: jsonEncode(login));
      return LoginPayloadDto.toObject(res.data["token"]);
    } catch (e) {
      rethrow;
    }
  }
}