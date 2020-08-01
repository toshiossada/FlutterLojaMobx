import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/product_model.dart';
// ignore: directives_ordering
import '../../../../shared/helpers/errors.dart';

abstract class IProductRepository implements Disposable {
  Future<Either<Failure, List<ProductModel>>> loadAllProducts();
}
