import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import '../../components/password_text_form_field/password_text_form_field_widget.dart';
import '../../components/text_form_field/text_form_field_widget.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Criar onta'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormFieldWidget(
                  textHint: 'Nome',
                  onChange: controller.setName,
                  onSaved: controller.setName,
                  validator: (v) {
                    if (v.isEmpty)
                      return ('Campo Obrigatório');
                    else
                      return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormFieldWidget(
                  textHint: 'E-mail',
                  onChange: controller.setEmail,
                  onSaved: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v.isEmpty)
                      return ('Campo Obrigatório');
                    else if (!controller.user.isValidEmail)
                      return ('E-mail Inválido');
                    else
                      return null;
                  },
                ),
                SizedBox(height: 16),
                PasswordTextFormFieldWidget(
                  onChange: controller.setPassword,
                  onSaved: controller.setPassword,
                  textHint: 'Senha',
                  validator: (v) {
                    if (v.isEmpty) return ('Campo Obrigatório');
                    if (!controller.user.isValidEmail)
                      return 'Digite um senha de no minimo 6 caracteres';
                    else
                      return null;
                  },
                ),
                SizedBox(height: 16),
                PasswordTextFormFieldWidget(
                  onChange: controller.setConfirmPassword,
                  onSaved: controller.setConfirmPassword,
                  textHint: 'Repita a Senha',
                  validator: (v) {
                    if (v.isEmpty) return ('Campo Obrigatório');
                    if (!controller.user.isValidPassword)
                      return 'Digite um senha de no minimo 6 caracteres';
                    else if (!controller.user.isPasswordEqual)
                      return 'Senhas não conferem';
                    else
                      return null;
                  },
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: Observer(
                    builder: (_) {
                      return RaisedButton(
                        onPressed: controller.cadastrar,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
