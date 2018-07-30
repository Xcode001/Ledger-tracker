import 'dart:async';

import 'package:vsii_trader/models/user.dart';

class WebClient {
  const WebClient();

  Future<User> fetchUser() async {
    return User(role: 'Retailer');
  }

  Future<bool> postUser(User user) async {
    return Future.value(true);
  }
}
