import '../repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<bool> execute(String username, String password) async {
    return await repository.loginUser(username, password);
  }
}
