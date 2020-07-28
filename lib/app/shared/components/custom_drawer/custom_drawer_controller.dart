import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../store/page_store.dart';

part 'custom_drawer_controller.g.dart';

@Injectable()
class CustomDrawerController = _CustomDrawerControllerBase
    with _$CustomDrawerController;

abstract class _CustomDrawerControllerBase with Store {
  final PageStore pageStore;
  @observable
  int page = 0;

  _CustomDrawerControllerBase(this.pageStore);

  @action
  void jumpToPage(int i) {
    page = i;
    pageStore.setPage(i);
  }
}
