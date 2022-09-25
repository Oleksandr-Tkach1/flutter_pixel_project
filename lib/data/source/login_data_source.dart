abstract class AuthDataSource {
  Future<void> authenticate(String email, String password);
}