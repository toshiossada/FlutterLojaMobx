import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cart_controller.dart';
import 'components/cart_tile/cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key key, this.title = "Cart"}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ModularState<CartPage, CartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Carrinho'),
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: controller.cartStore.listCart
                .map((element) => CartTileWidget(cartItem: element))
                .toList(),
          );
        },
      ),
    );
  }
}
