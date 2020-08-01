import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/components/text_form_field/text_form_field_widget.dart';

import 'password_text_form_field_controller.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  final String textHint;
  final TextEditingController controller;
  final Function(String) onChange;
  final Function(String) onSaved;
  final Function(String) validator;

  PasswordTextFormFieldWidget({
    Key key,
    this.textHint,
    this.controller,
    this.onChange,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldWidgetState createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState extends ModularState<
    PasswordTextFormFieldWidget, PasswordTextFormFieldController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TextFormFieldWidget(
          onChange: widget.onChange,
          onSaved: widget.onSaved,
          textHint: widget.textHint,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: !controller.visible,
          suffixIcon: IconButton(
            onPressed: controller.switchVisible,
            icon: Icon(
              controller.visible
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
