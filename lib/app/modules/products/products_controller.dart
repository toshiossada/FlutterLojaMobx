import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';
import 'stores/product_store.dart';

part 'products_controller.g.dart';

@Injectable()
class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final ProductStore productStore;

  _ProductsControllerBase(this.productStore);
}
