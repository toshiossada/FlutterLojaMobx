import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_size_model.dart';
import 'product_model.dart';

class CartModel {
  CartModel({this.product, this.size}) {
    productId = product.id;
    quantity = 1;
  }

  String productId;
  int quantity;
  ItemSizeModel size;

  ProductModel product;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};

  factory CartModel.fromDocument(DocumentSnapshot document) {
    var pId = document.data['pid'] as String;
    ProductModel product;
    Firestore.instance
        .document('products/$pId')
        .get()
        .then((value) => product = ProductModel.fromDocument(value));

    return CartModel(
      product: product,
      size: ItemSizeModel.fromMap(document.data['size']),
    );
  }
}
