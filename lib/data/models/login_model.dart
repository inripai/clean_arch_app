import '../../domain/entities/login_entity.dart';

class LoginModel extends Login {
  LoginModel({
    required String username,
    required String password,
  }) : super(
          username: username,
          password: password,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
