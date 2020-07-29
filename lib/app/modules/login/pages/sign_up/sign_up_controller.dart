import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/components/loading_dialog/loading_dialog.dart';
import '../../../../shared/models/signup_user_model.dart';
import '../../../../shared/services/interfaces/user_service_interface.dart';
import '../../../../shared/stores/user_store.dart';

part 'sign_up_controller.g.dart';

@Injectable()
class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ILoadingDialog _loading;
  final IUserService _userService;
  final UserStore userStore;

  _SignUpControllerBase(this._loading, this._userService, this.userStore);

  @observable
  String email;
  @observable
  String password;
  @observable
  String confirmPassword;
  @observable
  String name;
  @computed
  SignUpUserModel get user => SignUpUserModel(
      email: email,
      password: password,
      name: name,
      confirmPassword: confirmPassword);

  @computed
  bool get isValid =>
      user.isValidEmail &&
      user.isValidPassword &&
      user.isValidName &&
      user.isValidPassword;

  @action
  void setEmail(String v) => email = v;
  @action
  void setPassword(String v) => password = v;
  @action
  void setConfirmPassword(String v) => confirmPassword = v;
  @action
  void setName(String v) => name = v;

  Future<void> cadastrar() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        _loading.show();
        await Future.delayed(Duration(seconds: 1));
        var _ = await _userService.signup(user);
        await Future.delayed(Duration(seconds: 1));
        var currenteUser = await _userService.currentUser();
        currenteUser.fold(
            (l) => asuka.showSnackBar(SnackBar(
                  content: Text('Falha ao entrar: ${l.message}'),
                  backgroundColor: Colors.red,
                )),
            userStore.setUser);

        asuka.showSnackBar(
            SnackBar(content: Text('Usuario Criado com sucesso!')));
        Modular.to.pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
      } on Exception catch (e) {
        asuka.showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        await _loading.hide();
      }
    }
  }
}
