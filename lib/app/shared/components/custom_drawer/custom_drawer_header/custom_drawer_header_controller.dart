import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../stores/user_store.dart';

part 'custom_drawer_header_controller.g.dart';

@Injectable()
class CustomDrawerHeaderController = _CustomDrawerHeaderControllerBase
    with _$CustomDrawerHeaderController;

abstract class _CustomDrawerHeaderControllerBase with Store {
  final UserStore userStore;

  _CustomDrawerHeaderControllerBase(this.userStore);

  void registerTap() {
    if (userStore.isLoggedIn) {
      userStore.signOut();
    } else {
      Modular.to.pushNamed('/login');
    }
  }
}
