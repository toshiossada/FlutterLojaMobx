import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'shared/components/custom_drawer/custom_drawer_controller.dart';
import 'shared/store/page_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $PageStore,
        $CustomDrawerController,
        $AppController,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
