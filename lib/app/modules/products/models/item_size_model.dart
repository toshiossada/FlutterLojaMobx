class ItemSizeModel {
  final String name;
  final num price;
  final int stock;

  ItemSizeModel({this.name, this.price, this.stock});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'stock': stock,
    };
  }

  factory ItemSizeModel.fromMap(Map<String, dynamic> map) {
    return ItemSizeModel(
      name: map['name'] as String,
      price: map['price'] as num,
      stock: map['stock'] as int,
    );
  }

  bool get hasStok => stock > 0;
}
