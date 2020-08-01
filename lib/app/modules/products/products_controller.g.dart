// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProductsController = BindInject(
  (i) => ProductsController(i<ProductStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsControllerBase, Store {
  final _$valueAtom = Atom(name: '_ProductsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ProductsControllerBaseActionController =
      ActionController(name: '_ProductsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
