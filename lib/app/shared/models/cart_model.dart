import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_size_model.dart';
import 'product_model.dart';

class CartModel {
  CartModel({this.product, this.size}) {
    productId = product?.id;
    quantity = 1;
  }

  String productId;
  int quantity;
  ItemSizeModel size;

  ProductModel product;

  bool stackable(ProductModel p, ItemSizeModel i) =>
      p.id == productId && size.name == i.name;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toMap() => {
        'pId': productId,
        'quantity': quantity,
        'size': size.toMap(),
      };

  factory CartModel.fromDocument(
      DocumentSnapshot document, ProductModel product) {
    return CartModel(
      product: product,
      size: ItemSizeModel.fromMap(document.data['size']),
    );
  }
}
