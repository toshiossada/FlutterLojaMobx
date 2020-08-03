import 'package:flutter_modular/flutter_modular.dart';

import 'cart_controller.dart';
import 'cart_page.dart';

class CartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CartController,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CartPage()),
      ];

  static Inject get to => Inject<CartModule>.of();
}
