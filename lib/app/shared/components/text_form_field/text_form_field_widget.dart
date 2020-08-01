import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String textHint;
  final TextInputType keyboardType;
  final Function(String) validator;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextEditingController controller;
  final Function(String) onChange;
  final Function(String) onSaved;
  final Function(String) onFieldSubmitted;
  final InputBorder inputBorder;
  final TextInputAction textInputAction;
  final bool autofocus;
  final String initialValue;

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
    this.inputBorder,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autofocus = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: textHint,
        suffixIcon: suffixIcon,
        border: inputBorder,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType,
      autocorrect: false,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChange,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
    );
  }
}
