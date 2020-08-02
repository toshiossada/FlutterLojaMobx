import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

@Injectable()
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
