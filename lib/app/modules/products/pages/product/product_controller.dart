import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/products/stores/product_store.dart';
import 'package:mobx/mobx.dart';

import '../../models/product_model.dart';

part 'product_controller.g.dart';

@Injectable()
class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final String id;
  final ProductStore productStore;

  _ProductControllerBase(this.productStore, {@Param this.id}) {
    load();
  }
  @observable
  ProductModel product;

  @action
  void load() {
    product = productStore.products.firstWhere((element) => element.id == id);
  }
}
