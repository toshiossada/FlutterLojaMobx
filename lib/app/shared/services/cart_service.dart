import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../helpers/errors.dart';
import '../models/cart_model.dart';
import '../models/user_model.dart';
import '../repositories/interfaces/cart_repository_interface.dart';
import 'interfaces/cart_service_interface.dart';

part 'cart_service.g.dart';

@Injectable()
class CartService implements ICartService {
  final ICartRepository _cartRepository;

  CartService(this._cartRepository);

  @override
  void dispose() {}

  @override
  Future<Either<Failure, List<CartModel>>> currentUser(UserModel user) {
    return _cartRepository.currentUser(user);
  }
}
