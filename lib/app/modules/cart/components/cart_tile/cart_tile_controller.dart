import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'cart_tile_controller.g.dart';

@Injectable()
class CartTileController = _CartTileControllerBase with _$CartTileController;

abstract class _CartTileControllerBase with Store {}
