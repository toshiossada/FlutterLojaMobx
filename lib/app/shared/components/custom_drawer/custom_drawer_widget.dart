import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_drawer_controller.dart';
import 'custom_drawer_header/custom_drawer_header_widget.dart';
import 'drawer_tile/drawer_tile_widget.dart';

// ignore: must_be_immutable
class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Observer(
        builder: (_) {
          return ListView(
            children: [
              CustomDrawerHeaderWidget(),
              DrawerTileWidget(
                icon: Icons.home,
                title: 'Inicio',
                onTap: () => controller.jumpToPage(0),
                selected: controller.currentPage == 0,
              ),
              DrawerTileWidget(
                icon: Icons.list,
                title: 'Produtos',
                onTap: () => controller.jumpToPage(1),
                selected: controller.currentPage == 1,
              ),
              DrawerTileWidget(
                icon: Icons.playlist_add_check,
                title: 'Meus Pedidos',
                onTap: () => controller.jumpToPage(2),
                selected: controller.currentPage == 2,
              ),
              DrawerTileWidget(
                icon: Icons.location_on,
                title: 'Lojas',
                onTap: () => controller.jumpToPage(3),
                selected: controller.currentPage == 3,
              ),
            ],
          );
        },
      ),
    );
  }
}
