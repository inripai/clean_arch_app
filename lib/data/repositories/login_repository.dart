import 'dart:convert';
import '../../domain/repositories/login_repository.dart';
import '../api/dao/login_dao.dart';

class LoginRepositoryImpl implements LoginRepository {
  final Login_Dao loginDao;

  LoginRepositoryImpl(this.loginDao);

  @override
  Future<bool> loginUser(String username, String password) async {
    String b64 = base64Encode(utf8.encode('$username:$password'));
    final response = await loginDao.Call_Login_API(b64);
    return response == 200;
  }
}
