// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CartStore = BindInject(
  (i) => CartStore(),
  singleton: true,
  lazy: false,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$listCartAtom = Atom(name: '_CartStoreBase.listCart');

  @override
  ObservableList<CartModel> get listCart {
    _$listCartAtom.reportRead();
    return super.listCart;
  }

  @override
  set listCart(ObservableList<CartModel> value) {
    _$listCartAtom.reportWrite(value, super.listCart, () {
      super.listCart = value;
    });
  }

  final _$userAtom = Atom(name: '_CartStoreBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  void add(ProductModel product, ItemSizeModel size) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.add');
    try {
      return super.add(product, size);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCart: ${listCart},
user: ${user}
    ''';
  }
}
