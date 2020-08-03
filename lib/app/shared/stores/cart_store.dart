import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/cart_model.dart';
import '../models/item_size_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

part 'cart_store.g.dart';

@Injectable(lazy: false)
class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  ObservableList<CartModel> listCart = ObservableList<CartModel>();
  @observable
  UserModel user;

  void updateUser(UserModel user) {    
    this.user = user;
    listCart.clear();
    if(this.user!= null){

    }
  }

  @action
  void add(ProductModel product, ItemSizeModel size) {
    listCart.add(CartModel(
      product: product,
      size: size,
    ));
  }
}
