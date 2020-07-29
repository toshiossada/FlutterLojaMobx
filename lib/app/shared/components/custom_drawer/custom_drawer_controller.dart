import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../stores/page_store.dart';

part 'custom_drawer_controller.g.dart';

@Injectable()
class CustomDrawerController = _CustomDrawerControllerBase
    with _$CustomDrawerController;

abstract class _CustomDrawerControllerBase with Store {
  final PageStore pageStore;

  @observable
  int currentPage = 0;

  _CustomDrawerControllerBase(this.pageStore);

  @action
  void jumpToPage(int i) {
    currentPage = i;
    pageStore.setPage(i);
  }
}
