import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:string_validator/string_validator.dart' as validator;

class SignUpUserModel {
  final String id;
  final String email;
  final String password;
  final String name;
  final String confirmPassword;

  SignUpUserModel({
    this.email,
    this.password,
    this.name,
    this.confirmPassword,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
    };
  }

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');

  bool get isValidEmail => validator.isEmail(email ?? "");
  bool get isValidPassword =>
      password != null && password.isNotEmpty && password.length >= 6;
  bool get isConfirmPassword =>
      confirmPassword != null &&
      confirmPassword.isNotEmpty &&
      confirmPassword.length >= 6;
  bool get isValidName => name != null && name.isNotEmpty;
  bool get isPasswordEqual => password == confirmPassword;

  SignUpUserModel copyWith({
    String id,
    String email,
    String password,
    String name,
    String confirmPassword,
  }) {
    return SignUpUserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
