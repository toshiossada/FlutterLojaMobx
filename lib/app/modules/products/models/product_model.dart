import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_size_model.dart';

class ProductModel {
  final String name;
  final String description;
  final List<String> images;
  final String id;
  final List<ItemSizeModel> sizes;

  ProductModel({
    this.name,
    this.description,
    this.images,
    this.id,
    this.sizes,
  });

  factory ProductModel.fromDocument(DocumentSnapshot document) {
    return ProductModel(
        id: document.documentID,
        name: document['name'] as String,
        description: document['description'] as String,
        images: List<String>.from(document['images'] as List<dynamic>),
        sizes: (document['sizes'] as List<dynamic> ?? [])
            .map((e) => ItemSizeModel.fromMap(e))
            .toList());
  }

  int get totalStock => sizes.fold(0, (sum, size) => sum + size.stock);
  bool get hasStock => totalStock > 0;
}
