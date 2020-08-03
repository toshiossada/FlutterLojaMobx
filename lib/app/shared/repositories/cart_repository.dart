import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../helpers/errors.dart';
import '../helpers/firebase_errors.dart' as firebase_errors;
import '../models/cart_model.dart';
import '../models/user_model.dart';
import 'interfaces/cart_repository_interface.dart';

part 'cart_repository.g.dart';

@Injectable()
class CartRepository implements ICartRepository {
  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<Either<Failure, List<CartModel>>> currentUser(UserModel user) async {
    try {
      var cartSnap = await Firestore.instance
          .document('users/${user.id}')
          .collection('cart')
          .getDocuments();
      var items =
          cartSnap.documents.map((d) => CartModel.fromDocument(d)).toList();
      return Right(items);
    } on PlatformException catch (e) {
      return Left(FirebaseFailure(
          message: firebase_errors.getErrorString(e.code), code: e.code));
    } on Exception catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }
}
