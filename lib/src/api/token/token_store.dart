abstract class TokenStore {

  Future<void> delete();

  Future<void> save(String data);

  Future<String> read();

}