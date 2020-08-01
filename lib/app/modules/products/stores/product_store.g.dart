// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProductStore = BindInject(
  (i) => ProductStore(i<IProductService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStoreBase, Store {
  Computed<List<ProductModel>> _$filteredProductsComputed;

  @override
  List<ProductModel> get filteredProducts => (_$filteredProductsComputed ??=
          Computed<List<ProductModel>>(() => super.filteredProducts,
              name: '_ProductStoreBase.filteredProducts'))
      .value;

  final _$productsAtom = Atom(name: '_ProductStoreBase.products');

  @override
  ObservableList<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$searchAtom = Atom(name: '_ProductStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$loadProductsAsyncAction =
      AsyncAction('_ProductStoreBase.loadProducts');

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  final _$_ProductStoreBaseActionController =
      ActionController(name: '_ProductStoreBase');

  @override
  void setSearch(String v) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setSearch');
    try {
      return super.setSearch(v);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
search: ${search},
filteredProducts: ${filteredProducts}
    ''';
  }
}
