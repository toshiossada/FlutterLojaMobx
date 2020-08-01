import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/stores/user_store.dart';
import '../../../../models/item_size_model.dart';

part 'information_controller.g.dart';

@Injectable(singleton: false)
class InformationController = _InformationControllerBase
    with _$InformationController;

abstract class _InformationControllerBase with Store {
  final UserStore userStore;

  @observable
  ItemSizeModel seletedSize;

  _InformationControllerBase(this.userStore);
  @action
  void setSelectedSize(ItemSizeModel v) => seletedSize = v;

  void addCart() {
    if (userStore.isLoggedIn) {
    } else {
      Modular.to.pushNamed('/login');
    }
  }
}
