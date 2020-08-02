import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/helpers/errors.dart';
import '../../../../shared/models/product_model.dart';

abstract class IProductService implements Disposable {
  Future<Either<Failure, List<ProductModel>>> loadAllProducts();
}
