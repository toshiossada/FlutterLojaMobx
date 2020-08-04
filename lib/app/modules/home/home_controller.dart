import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';


import '../../shared/services/interfaces/user_service_interface.dart';
import '../../shared/stores/page_store.dart';
import '../../shared/stores/user_store.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PageStore pageStore;
  final IUserService _userService;
  final UserStore userStore;
  _HomeControllerBase(
    this.pageStore,
    this._userService,
    this.userStore,
  ) {
    _load();
  }

  @action
  Future<void> _load() async {
    try {
      var result = await _userService.currentUser();
      result.fold((failure) {
        asuka.showSnackBar(SnackBar(
          content: Text('Falha ao entrar: ${failure.message}'),
          backgroundColor: Colors.red,
        ));
      }, (user) {
        if (user.id != null) {
          userStore.setUser(user);
        }
      });
    } on Exception catch (e) {
      asuka.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
