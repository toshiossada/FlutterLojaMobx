import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/services/cart_service.dart';
import '../../shared/stores/cart_store.dart';

part 'cart_controller.g.dart';

@Injectable()
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final CartStore cartStore;
  final CartService _cartService;
  _CartControllerBase(this.cartStore, this._cartService);
}
