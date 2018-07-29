import 'dart:async';

import 'package:vsii_trader/models/user.dart';

class WebClient {
  const WebClient();

  Future<User> fetchUser() async {
    return User(
        username: 'IBM', email: '4202', phone: 'phone', role: 'Retailer');
  }

  Future<bool> postUser(User user) async {
    return Future.value(true);
  }
}
