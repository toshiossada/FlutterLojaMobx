import 'package:flutter_modular/flutter_modular.dart';

import 'pages/product/components/information/information_controller.dart';
import 'pages/product/product_controller.dart';
import 'pages/product/product_page.dart';
import 'products_controller.dart';
import 'products_page.dart';
import 'repositories/product_repository.dart';
import 'services/product_service.dart';
import 'stores/product_store.dart';

class ProductsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $InformationController,
        $ProductController,
        $ProductsController,
        $ProductService,
        $ProductStore,
        $ProductRepository,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProductsPage()),
        Router('/product/:id', child: (_, args) => ProductPage()),
      ];

  static Inject get to => Inject<ProductsModule>.of();
}
