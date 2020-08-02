import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/helpers/errors.dart';
import '../../../shared/helpers/firebase_errors.dart' as firebase_erros;

import '../../../shared/models/product_model.dart';

import 'interfaces/product_repository_interface.dart';

part 'product_repository.g.dart';

@Injectable()
class ProductRepository implements IProductRepository {
  final Firestore _firestore = Firestore.instance;

  ProductRepository();

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<Either<Failure, List<ProductModel>>> loadAllProducts() async {
    try {
      var snap = await _firestore.collection('products').getDocuments();

      var result =
          snap.documents.map((e) => ProductModel.fromDocument(e)).toList();
      return Right(result);
    } on PlatformException catch (e) {
      return Left(FirebaseFailure(
          message: firebase_erros.getErrorString(e.code), code: e.code));
    } on Exception catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }
}
