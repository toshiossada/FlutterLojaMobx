import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/models/item_size_model.dart';
import '../../../../../../shared/models/product_model.dart';
import '../../../../../../shared/stores/cart_store.dart';
import '../../../../../../shared/stores/user_store.dart';

part 'information_controller.g.dart';

@Injectable(singleton: false)
class InformationController = _InformationControllerBase
    with _$InformationController;

abstract class _InformationControllerBase with Store {
  final UserStore userStore;
  final CartStore cartStore;

  @observable
  ItemSizeModel seletedSize;

  ProductModel product;

  _InformationControllerBase(this.userStore, this.cartStore);
  @action
  void setSelectedSize(ItemSizeModel v) => seletedSize = v;

  void addCart() {
    if (userStore.isLoggedIn) {
      cartStore.add(product, seletedSize);
      Modular.to.pushNamed('/cart');
    } else {
      Modular.to.pushNamed('/login');
    }
  }
}
