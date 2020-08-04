import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../components/loading_dialog/loading_dialog.dart';
import '../models/cart_model.dart';
import '../models/item_size_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';
import '../services/interfaces/cart_service_interface.dart';

part 'cart_store.g.dart';

@Injectable(lazy: false)
class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final ICartService _cartService;
  final ILoadingDialog _loading;

  @observable
  ObservableList<CartModel> listCart = ObservableList<CartModel>();
  @observable
  UserModel user;

  _CartStoreBase(
    this._cartService,
    this._loading,
  );

  Future<void> updateUser(UserModel user) async {
    this.user = user;
    listCart.clear();
    if (this.user != null) {
      try {
        _loading.show();
        await Future.delayed(Duration(seconds: 1));
        var result = await _cartService.getCartUser(user);
        result.fold((failure) {
          asuka.showSnackBar(SnackBar(
            content: Text('Falha ao entrar: ${failure.message}'),
            backgroundColor: Colors.red,
          ));
        }, (result) {
          listCart = result.asObservable();
        });
      } on Exception catch (e) {
        asuka.showSnackBar(SnackBar(
          content: Text('Falha ao entrar: ${e.toString()}'),
          backgroundColor: Colors.red,
        ));
      } finally {
        _loading.hide();
      }
    }
  }

  @action
  void add(ProductModel product, ItemSizeModel size) {
    try {
      var item = listCart.firstWhere(
          (element) => element.stackable(product, size),
          orElse: () => null);
      if (item != null) {
        item.quantity++;
        print(item.quantity);
      } else {
        var item = CartModel(
          product: product,
          size: size,
        );

        listCart.add(item);

        _cartService.add(user, item);
      }
    } on Exception catch (err) {
      print(err.toString());
    }
  }
}
