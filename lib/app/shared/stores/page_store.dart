import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'page_store.g.dart';

@Injectable()
class PageStore = _PageStoreBase with _$PageStore;

abstract class _PageStoreBase with Store {
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;
  void setPage(int i) {
    if (_pageController.page != i) _pageController.jumpToPage(i);
  }
}
