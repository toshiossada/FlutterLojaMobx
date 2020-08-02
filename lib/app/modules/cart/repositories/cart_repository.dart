import 'package:flutter_modular/flutter_modular.dart';
import 'interfaces/cart_repository_interface.dart';

part 'cart_repository.g.dart';

@Injectable()
class CartRepository implements ICartRepository {
  //dispose will be called automatically
  @override
  void dispose() {}
}
