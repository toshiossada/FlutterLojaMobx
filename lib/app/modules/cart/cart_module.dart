import 'components/cart_tile/cart_tile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cart_controller.dart';
import 'cart_page.dart';
import 'repositories/cart_repository.dart';
import 'services/cart_service.dart';

class CartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CartTileController()),
        $CartService,
        $CartRepository,
        $CartController,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CartPage()),
      ];

  static Inject get to => Inject<CartModule>.of();
}
