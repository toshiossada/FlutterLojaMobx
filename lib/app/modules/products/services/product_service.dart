import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/helpers/errors.dart';
import '../../../shared/models/product_model.dart';
import '../repositories/interfaces/product_repository_interface.dart';
import 'interfaces/product_service_interface.dart';

part 'product_service.g.dart';

@Injectable()
class ProductService implements IProductService {
  final IProductRepository _productRepository;

  ProductService(this._productRepository);
  @override
  void dispose() {}

  @override
  Future<Either<Failure, List<ProductModel>>> loadAllProducts() {
    return _productRepository.loadAllProducts();
  }
}
