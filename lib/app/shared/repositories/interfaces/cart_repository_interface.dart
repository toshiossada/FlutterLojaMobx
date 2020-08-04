import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../helpers/errors.dart';
import '../../models/cart_model.dart';
import '../../models/user_model.dart';

abstract class ICartRepository implements Disposable {
  Future<Either<Failure, List<CartModel>>> getCartUser(UserModel user);
  Future<Either<Failure, bool>> add(UserModel user, CartModel item);
}
