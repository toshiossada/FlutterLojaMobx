import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String textHint;
  final TextInputType keyboardType;
  final Function(String) validator;
  final bool obscureText;
  final Widget suffixIcon;
  final TextEditingController controller;
  final Function(String) onChange;
  final Function(String) onSaved;

  const TextFormFieldWidget({
    Key key,
    this.textHint,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.onChange,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: textHint,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      autocorrect: false,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChange,
      onSaved: onSaved,
    );
  }
}
