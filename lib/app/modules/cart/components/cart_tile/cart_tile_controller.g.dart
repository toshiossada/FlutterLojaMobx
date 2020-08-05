// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_tile_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CartTileController = BindInject(
  (i) => CartTileController(i<CartStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartTileController on _CartTileControllerBase, Store {
  final _$cartItemAtom = Atom(name: '_CartTileControllerBase.cartItem');

  @override
  CartModel get cartItem {
    _$cartItemAtom.reportRead();
    return super.cartItem;
  }

  @override
  set cartItem(CartModel value) {
    _$cartItemAtom.reportWrite(value, super.cartItem, () {
      super.cartItem = value;
    });
  }

  final _$_CartTileControllerBaseActionController =
      ActionController(name: '_CartTileControllerBase');

  @override
  void setCartItem(CartModel v) {
    final _$actionInfo = _$_CartTileControllerBaseActionController.startAction(
        name: '_CartTileControllerBase.setCartItem');
    try {
      return super.setCartItem(v);
    } finally {
      _$_CartTileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_CartTileControllerBaseActionController.startAction(
        name: '_CartTileControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CartTileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CartTileControllerBaseActionController.startAction(
        name: '_CartTileControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CartTileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartItem: ${cartItem}
    ''';
  }
}
