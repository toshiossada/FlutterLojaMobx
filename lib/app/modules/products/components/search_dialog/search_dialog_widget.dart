import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/components/text_form_field/text_form_field_widget.dart';

class SearchDialogWidget extends StatelessWidget {
  final String initialValue;
  const SearchDialogWidget({Key key, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextFormFieldWidget(
              inputBorder: InputBorder.none,
              autofocus: true,
              textHint: 'Pesquisar',
              textInputAction: TextInputAction.search,
              prefixIcon: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.grey[700],
                onPressed: Modular.to.pop,
              ),
              onFieldSubmitted: (v) => Modular.to.pop(v),
              initialValue: initialValue,
            ),
          ),
        )
      ],
    );
  }
}
