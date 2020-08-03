import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'cart_store.dart';
import 'user_store.dart';

part 'page_store.g.dart';

@Injectable()
class PageStore = _PageStoreBase with _$PageStore;

abstract class _PageStoreBase extends Disposable with Store {
  final PageController _pageController = PageController();
  final UserStore userStore;
  final CartStore cartStore;

  ReactionDisposer disposeUpdateCartUser;

  _PageStoreBase(this.userStore, this.cartStore) {
    disposeUpdateCartUser = autorun((_) {
      if (cartStore.user != userStore.user) {
        cartStore.updateUser(userStore.user);
      }
    });
  }

  PageController get pageController => _pageController;
  void setPage(int i) {
    if (_pageController.page != i) _pageController.jumpToPage(i);
  }

  @override
  void dispose() {
    disposeUpdateCartUser;
  }
}
