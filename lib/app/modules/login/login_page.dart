import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:string_validator/string_validator.dart' as validator;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/password_text_form_field/password_text_form_field_widget.dart';
import 'components/text_form_field/text_form_field_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Modular.link.pushNamed('signup');
            },
            child: const Text(
              'Criar Conta',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: controller.formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                TextFormFieldWidget(
                  textHint: 'Email',
                  onChange: controller.setEmail,
                  onSaved: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (!validator.isEmail(v))
                      return ('E-mail Inválido');
                    else
                      return null;
                  },
                ),
                const SizedBox(height: 16),
                PasswordTextFormFieldWidget(
                  textHint: 'Senha',
                  onChange: controller.setPassword,
                  onSaved: controller.setPassword,
                  validator: (pass) {
                    if (pass.isEmpty)
                      return 'Campo Obrigatório';
                    else if (pass.length < 6) return 'Senha muito curta';
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Text('Esqueci minha senha'),
                  ),
                ),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 44,
                    child: RaisedButton(
                      onPressed: controller.isValid ? controller.login : null,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
