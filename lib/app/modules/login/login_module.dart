import 'package:flutter_modular/flutter_modular.dart';

import 'components/password_text_form_field/password_text_form_field_controller.dart';
import 'login_controller.dart';
import 'login_page.dart';
import 'pages/sign_up/sign_up_controller.dart';
import 'pages/sign_up/sign_up_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SignUpController,
        $PasswordTextFormFieldController,
        $LoginController,
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('signup', child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
