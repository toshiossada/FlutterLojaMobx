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

  @override
  String toString() {
    return '''
listCart: ${listCart}
    ''';
  }
}
