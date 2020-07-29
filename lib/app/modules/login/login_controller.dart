import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/shared/stores/user_store.dart';
import 'package:mobx/mobx.dart';

import '../../shared/components/loading_dialog/loading_dialog.dart';
import '../../shared/models/user_model.dart';
import 'models/login_user_model.dart';
import 'services/interfaces/user_service_interface.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final IUserService _userService;
  final ILoadingDialog _loading;
  final UserStore userStore;

  @observable
  String email;
  @observable
  String password;
  @observable
  UserModel user;
  @computed
  LoginUserModel get credential =>
      LoginUserModel(email: email, password: password);

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidPassword;

  _LoginControllerBase(this._userService, this._loading, this.userStore) {
    _load();
  }

  @action
  void setEmail(String v) => email = v;
  @action
  void setPassword(String v) => password = v;

  Future<void> login() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        _loading.show();
        await Future.delayed(Duration(seconds: 1));
        var result = await _userService.sign(credential);
        result.fold((failure) {
          asuka.showSnackBar(SnackBar(
            content: Text('Falha ao entrar: ${failure.message}'),
            backgroundColor: Colors.red,
          ));
        }, (user) {
          this.user = user;
          userStore.setUser(user);
          // Modular.to.pushReplacementNamed('/home');
        });
      } on Exception catch (e) {
        asuka.showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        await _loading.hide();
      }
    }
  }

  @action
  Future<void> _load() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var result = await _userService.currentUser();
      result.fold((failure) {
        asuka.showSnackBar(SnackBar(
          content: Text('Falha ao entrar: ${failure.message}'),
          backgroundColor: Colors.red,
        ));
      }, (user) {
        this.user = user;
        userStore.setUser(user);
      });
    } on Exception catch (e) {
      asuka.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
