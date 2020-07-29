import 'package:string_validator/string_validator.dart' as validator;
import '../../../shared/models/user_model.dart';

class LoginUserModel {
  final String email;
  final String password;

  LoginUserModel({
    this.email,
    this.password,
  });

  LoginUserModel copyWith({
    String email,
    String password,
    UserModel user,
  }) {
    return LoginUserModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  bool get isValidEmail => validator.isEmail(email ?? "");
  bool get isValidPassword =>
      password != null && password.isNotEmpty && password.length >= 6;
}
