import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/user_model.dart';

part 'user_store.g.dart';

@Injectable()
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  UserModel user;
  @computed
  bool get isLoggedIn => user != null;
  @action
  void setUser(UserModel v) => user = v;

  @action
  void signOut() => user = null;
}
