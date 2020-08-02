import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/product_model.dart';
import '../services/interfaces/product_service_interface.dart';

part 'product_store.g.dart';

@Injectable()
class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final IProductService _productService;

  @observable
  ObservableList<ProductModel> products = <ProductModel>[].asObservable();
  @observable
  String search = '';
  @computed
  List<ProductModel> get filteredProducts => products
      ?.where((element) =>
          element.name.toLowerCase().contains((search ?? '').toLowerCase()))
      ?.toList();

  _ProductStoreBase(this._productService) {
    loadProducts();
  }

  @action
  void setSearch(String v) => search = v;

  @action
  Future<void> loadProducts() async {
    var result = await _productService.loadAllProducts();
    result.map((r) => products = r.asObservable());
  }
}
