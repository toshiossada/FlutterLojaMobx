import 'components/cart_tile/cart_tile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cart_page.dart';
import 'cart_controller.dart';

class CartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CartTileController,
        $CartController,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CartPage()),
      ];

  static Inject get to => Inject<CartModule>.of();
}
