abstract class AuthRepo {
  Future<void> login(String email, String password);

  Future<void> register({
    required String email,
    required String password,
    required String username,
    required String phonenumber,
  });
}
