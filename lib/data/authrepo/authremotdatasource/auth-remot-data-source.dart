abstract class AuthRemotDataSource {
  Future login(String email, String password);

  Future register(
      {required String email,
        required String password,
        required String username,
        required String phonenumber});
}
