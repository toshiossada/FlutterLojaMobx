import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/helpers/errors.dart';
import '../../models/login_user_model.dart';
import '../../models/signup_user_model.dart';
import '../../../../shared/models/user_model.dart';

abstract class IUserService implements Disposable {
  Future<Either<Failure, UserModel>> sign(LoginUserModel user);
  Future<Either<Failure, UserModel>> currentUser();
  Future<Either<Failure, UserModel>> getDocumentUser(String id);
  Future<Either<Failure, AuthResult>> signup(SignUpUserModel user);
}
