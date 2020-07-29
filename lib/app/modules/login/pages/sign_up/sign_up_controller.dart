import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/login/services/interfaces/user_service_interface.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/components/loading_dialog/loading_dialog.dart';
import '../../models/signup_user_model.dart';

part 'sign_up_controller.g.dart';

@Injectable()
class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ILoadingDialog _loading;
  final IUserService _userService;

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

  _SignUpControllerBase(this._loading, this._userService);

  Future<void> cadastrar() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        _loading.show();
        await Future.delayed(Duration(seconds: 1));
        var _ = await _userService.signup(user);
        asuka.showSnackBar(
            SnackBar(content: Text('Usuario Criado com sucesso!')));
        Modular.to.pop();
      } on Exception catch (e) {
        asuka.showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        await _loading.hide();
      }
    }
  }
}
