// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProductController = BindInject(
  (i) => ProductController(i<ProductStore>(), id: i.args.params['id']),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductControllerBase, Store {
  final _$productAtom = Atom(name: '_ProductControllerBase.product');

  @override
  ProductModel get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductModel value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase');

  @override
  void load() {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.load');
    try {
      return super.load();
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product}
    ''';
  }
}
