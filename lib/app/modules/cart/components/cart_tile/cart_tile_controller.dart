import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/models/cart_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/stores/cart_store.dart';

part 'cart_tile_controller.g.dart';

@Injectable()
class CartTileController = _CartTileControllerBase with _$CartTileController;

abstract class _CartTileControllerBase with Store {
  final CartStore cartStore;

  _CartTileControllerBase(this.cartStore);

  @observable
  CartModel cartItem;

  @action
  void setCartItem(CartModel v) => cartItem = v;
  @action
  void increment() {
    cartItem = cartStore.increment(cartItem)..copyWith();
  }

  @action
  void decrement() {
    cartItem = cartStore.decrement(cartItem)..copyWith();
  }
}
