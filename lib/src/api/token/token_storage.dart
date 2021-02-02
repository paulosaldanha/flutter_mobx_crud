import 'dart:async';
import 'package:ecommerceBankPay/src/api/token/token_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage implements TokenStore{
  final Completer<SharedPreferences> _completer =
      Completer<SharedPreferences>();

  TokenStorage() {
    _completer.complete(SharedPreferences.getInstance());
  }

  @override
  Future<void> delete() async {
    try {
      final prefs = await _completer.future;
      await prefs.remove("token");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> save( String data) async {
    try {
      final prefs = await _completer.future;
      await prefs.setString("token", data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> read() async {
    try {
      final prefs = await _completer.future;
      final result = prefs.getString("token");
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Future<LoginPayloadDto> getPayLoad() async {
  //   String token = await read();
  //   return LoginPayloadDto.toObject(token);
  // }
}
