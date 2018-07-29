import 'dart:async';
import 'dart:core';

import 'package:vsii_trader/models/user.dart';

abstract class UserRepository {
  Future<User> loadUser();

  Future saveUser(User user);
}
