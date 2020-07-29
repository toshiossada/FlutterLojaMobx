import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/helpers/errors.dart';
import '../../../shared/helpers/firebase_errors.dart';
import '../models/login_user_model.dart';
import '../models/signup_user_model.dart';
import '../../../shared/models/user_model.dart';
import 'interfaces/user_repository_interface.dart';

part 'user_repository.g.dart';

@Injectable()
class UserRepository implements IUserRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  @override
  void dispose() {}

  @override
  Future<Either<Failure, UserModel>> sign(LoginUserModel user) async {
    try {
      final authResult = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      var result = await getDocumentUser(authResult.user.uid);
      return result;
    } on PlatformException catch (e) {
      return Left(
          FirebaseFailure(message: getErrorString(e.code), code: e.code));
    } on Exception catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> currentUser() async {
    try {
      var user = await auth.currentUser();
      var result = await getDocumentUser(user.uid);
      return result;
    } on PlatformException catch (e) {
      return Left(
          FirebaseFailure(message: getErrorString(e.code), code: e.code));
    } on Exception catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getDocumentUser(String id) async {
    try {
      final doc = await firestore.collection('users').document(id).get();
      var user = UserModel.fromDocument(doc);
      return Right(user);
    } on PlatformException catch (e) {
      return Left(
          FirebaseFailure(message: getErrorString(e.code), code: e.code));
    } on Exception catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> signup(SignUpUserModel user) async {
    try {
      var result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      return Right(result);
    } on PlatformException catch (e) {
      return Left(
          FirebaseFailure(message: getErrorString(e.code), code: e.code));
    } on Exception catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveData(SignUpUserModel user) async {
    try {
      await user.firestoreRef.setData(user.toMap());
      return Right(true);
    } on PlatformException catch (e) {
      return Left(
          FirebaseFailure(message: getErrorString(e.code), code: e.code));
    } on Exception catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }
}
