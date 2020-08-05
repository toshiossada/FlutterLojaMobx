import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shaared/custom_icon_button/custom_icon_button_widget.dart';
import '../../../../shared/models/cart_model.dart';
import 'cart_tile_controller.dart';

class CartTileWidget extends StatelessWidget {
  final CartModel cartItem;
  final CartTileController controller = Modular.get();

  CartTileWidget({Key key, this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(cartItem.product.images.first),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: <Widget>[
                    Text(
                      cartItem.product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Tamanho: ${cartItem.size.name}',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    Text(
                      'R\$ ${cartItem.size.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomIconButtonWidget(
                  iconData: Icons.add,
                  color: Theme.of(context).primaryColor,
                  onTap: controller.increment,
                ),
                Observer(builder: (_) {
                  return Text(
                    cartItem.quantity.toString(),
                    style: const TextStyle(fontSize: 20),
                  );
                }),
                CustomIconButtonWidget(
                  iconData: Icons.remove,
                  color: Theme.of(context).primaryColor,
                  onTap: controller.decrement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
