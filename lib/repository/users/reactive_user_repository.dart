import 'dart:async';
import 'dart:core';

import 'package:vsii_trader/models/user.dart';

abstract class ReactiveUserRepository {
  Future<void> addNewUser(User user);
  Stream<User> user();
  Future<void> updateUser(User user);
}
