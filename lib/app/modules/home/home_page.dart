import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/components/custom_drawer/custom_drawer_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageStore.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawerWidget(),
          appBar: AppBar(
            title: const Text('Home'),
          ),
        ),
        Scaffold(
          drawer: CustomDrawerWidget(),
          appBar: AppBar(
            title: const Text('Home 2'),
          ),
        ),
        Scaffold(
          drawer: CustomDrawerWidget(),
          appBar: AppBar(
            title: const Text('Home 3 '),
          ),
        ),
        Scaffold(
          drawer: CustomDrawerWidget(),
          appBar: AppBar(
            title: const Text('Home 4'),
          ),
        ),
      ],
    );
  }
}
