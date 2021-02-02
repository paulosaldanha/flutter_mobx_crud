import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:ecommerceBankPay/src/api/token/token_storage.dart';

import 'default_interceptor.dart';

class Api extends DioForNative {
  BaseOptions baseOptions;
  Api([this.baseOptions]) : super(baseOptions) {
    if (this.baseOptions?.baseUrl == null) {
      this.options.baseUrl =
          "https://ecommercebank.tk/ecommerce/api";
    }
    interceptors.addAll([
      DefaultInterceptor(TokenStorage()),
    ]);
  }
}
