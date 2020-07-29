import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../helpers/errors.dart';
import '../models/login_user_model.dart';
import '../models/signup_user_model.dart';
import '../models/user_model.dart';
import '../repositories/interfaces/user_repository_interface.dart';
import 'interfaces/user_service_interface.dart';

part 'user_service.g.dart';

@Injectable()
class UserService implements IUserService {
  final IUserRepository _userReppository;

  UserService(this._userReppository);
  @override
  void dispose() {}

  @override
  Future<Either<Failure, UserModel>> sign(LoginUserModel user) {
    return _userReppository.sign(user);
  }

  @override
  Future<Either<Failure, UserModel>> currentUser() {
    return _userReppository.currentUser();
  }

  @override
  Future<Either<Failure, AuthResult>> signup(SignUpUserModel user) async {
    var result = await _userReppository.signup(user);

    result.map((u) {
      user = user.copyWith(id: u.user.uid);
      _userReppository.saveData(user);
    });

    return result;
  }

  @override
  Future<Either<Failure, UserModel>> getDocumentUser(String id) {
    return _userReppository.getDocumentUser(id);
  }

  @override
  Future<Either<Failure, bool>> signOut() {
    return _userReppository.signOut();
  }
}
