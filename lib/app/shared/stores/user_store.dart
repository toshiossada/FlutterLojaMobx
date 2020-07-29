import 'package:flutter_modular/flutter_modular_annotations.dart';
import 'package:mobx/mobx.dart';

import '../models/user_model.dart';

part 'user_store.g.dart';

@Injectable()
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  UserModel user;

  void setUser(UserModel v) => user = v;
}
