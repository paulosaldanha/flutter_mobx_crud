import 'package:cloud_crm/src/api/default_interceptor.dart';
import 'package:cloud_crm/src/api/token/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class Api extends DioForNative {
  BaseOptions baseOptions;
  Api([this.baseOptions]) : super(baseOptions) {
    if (this.baseOptions?.baseUrl == null) {
      // this.options.baseUrl =
      // "http://189.126.34.133/CloudApiProduction/API-Gateway";
      this.options.baseUrl = "http://189.126.34.133/LaravelCRM/API-Gateway";
    }
    interceptors.addAll([
      DefaultInterceptor(TokenStorage()),
    ]);
  }
}