import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:vsii_trader/models/user.dart';
import 'package:vsii_trader/repository/users/user_repository.dart';
import 'package:vsii_trader/repository/users/file_storage.dart';
import 'package:vsii_trader/repository/users/web_client.dart';

class UserRepositoryFlutter implements UserRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const UserRepositoryFlutter({
    this.fileStorage,
    this.webClient = const WebClient(),
  });

  @override
  Future<User> loadUser() async {
    try {
      final user = await webClient.fetchUser();
      fileStorage.saveUser(user);
      return user;
    } catch (e) {
      return await fileStorage.loadUuser();
    }
  }

  @override
  Future saveUser(User user) {
    return Future.wait<dynamic>([
      fileStorage.saveUser(user),
      webClient.postUser(user),
    ]);
  }
}
