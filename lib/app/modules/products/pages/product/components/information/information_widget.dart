import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../models/product_model.dart';
import 'information_controller.dart';
import 'size/size_widget.dart';

class InformationWidget extends StatefulWidget {
  final ProductModel product;
  final Color primaryColor;

  const InformationWidget({
    Key key,
    this.product,
    this.primaryColor,
  }) : super(key: key);

  @override
  _InformationWidgetState createState() => _InformationWidgetState();
}

class _InformationWidgetState
    extends ModularState<InformationWidget, InformationController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'A partir de',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
          Text(
            "R\$ 19.99",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: widget.primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8, top: 16),
            child: Text(
              'Descrição',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            widget.product.description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8, top: 16),
            child: Text(
              'Descrição',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.product.sizes
                    .map((e) => SizeWidget(
                          size: e,
                          selectedSize: controller.seletedSize,
                          onTap: controller.setSelectedSize,
                        ))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 20),
          Observer(builder: (_) {
            return (widget.product.hasStock)
                ? SizedBox(
                    height: 44,
                    child: RaisedButton(
                      onPressed: controller.seletedSize != null
                          ? controller.addCart
                          : null,
                      color: widget.primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        controller.userStore.isLoggedIn
                            ? 'Adicionar ao Carrinho'
                            : 'Entre para Comprar',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : Container();
          })
        ],
      ),
    );
  }
}
