import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/cart/cart_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/products/products_module.dart';
import 'shared/components/custom_drawer/custom_drawer_controller.dart';
import 'shared/components/custom_drawer/custom_drawer_header/custom_drawer_header_controller.dart';
import 'shared/components/loading_dialog/loading_dialog.dart';
import 'shared/repositories/cart_repository.dart';
import 'shared/repositories/user_repository.dart';
import 'shared/services/cart_service.dart';
import 'shared/services/user_service.dart';
import 'shared/stores/cart_store.dart';
import 'shared/stores/page_store.dart';
import 'shared/stores/user_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $CartStore,
        $CustomDrawerHeaderController,
        $UserStore,
        $PageStore,
        $CustomDrawerController,
        $AppController,
        $LoadingDialog,
        $UserService,
        $UserRepository,
        $CartService,
        $CartRepository,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/products', module: ProductsModule()),
        Router('/cart', module: CartModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
