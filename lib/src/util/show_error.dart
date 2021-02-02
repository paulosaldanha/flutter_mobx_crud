import 'package:dio/dio.dart';
import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:flutter/material.dart';

showError(dynamic error, context) {
  String message = "Ocorreu um erro, por favor tente novamente mais tarde.";
  if (error is DioError) {
    if (error.response.statusCode == 401) {
      AuthService.logout();
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
      if (error.response.data['error'] != null) {
        message = error.response.data['error'];
      }
    }
    if (error.response.statusCode == 422) {
      message = error.response.data['message'];
    }
  }
  showDialog(
      context: context,
      child: AlertDialog(title: Text("Atenção!"), content: Text(message)));
}