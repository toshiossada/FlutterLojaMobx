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
}
