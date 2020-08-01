import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:loja/app/modules/products/products_controller.dart';
import 'package:loja/app/modules/products/products_module.dart';

void main() {
  initModule(ProductsModule());
  // ProductsController products;
  //
  setUp(() {
    //     products = ProductsModule.to.get<ProductsController>();
  });

  group('ProductsController Test', () {
    //   test("First Test", () {
    //     expect(products, isInstanceOf<ProductsController>());
    //   });

    //   test("Set Value", () {
    //     expect(products.value, equals(0));
    //     products.increment();
    //     expect(products.value, equals(1));
    //   });
  });
}
