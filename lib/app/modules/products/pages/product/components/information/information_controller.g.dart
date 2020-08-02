// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InformationController = BindInject(
  (i) => InformationController(i<UserStore>(), i<CartStore>()),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InformationController on _InformationControllerBase, Store {
  final _$seletedSizeAtom =
      Atom(name: '_InformationControllerBase.seletedSize');

  @override
  ItemSizeModel get seletedSize {
    _$seletedSizeAtom.reportRead();
    return super.seletedSize;
  }

  @override
  set seletedSize(ItemSizeModel value) {
    _$seletedSizeAtom.reportWrite(value, super.seletedSize, () {
      super.seletedSize = value;
    });
  }

  final _$_InformationControllerBaseActionController =
      ActionController(name: '_InformationControllerBase');

  @override
  void setSelectedSize(ItemSizeModel v) {
    final _$actionInfo = _$_InformationControllerBaseActionController
        .startAction(name: '_InformationControllerBase.setSelectedSize');
    try {
      return super.setSelectedSize(v);
    } finally {
      _$_InformationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seletedSize: ${seletedSize}
    ''';
  }
}
