import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:vsii_trader/repository/users/reactive_user_repository.dart';
import 'package:vsii_trader/repository/users/user_repository.dart';
import 'package:vsii_trader/models/user.dart';

class ReactiveUsersRepositoryFlutter implements ReactiveUserRepository {
  final UserRepository _repository;
  final BehaviorSubject<User> _subject;
  bool _loaded = false;

  ReactiveUsersRepositoryFlutter({
    @required UserRepository repository,
    User seedValue,
  })  : this._repository = repository,
        this._subject = BehaviorSubject<User>(seedValue: seedValue);

  @override
  Future<void> addNewUser(User user) async {
    _subject.add(user);

    await _repository.saveUser(_subject.value);
  }

  @override
  Stream<User> user() {
    if (!_loaded) _loadUsers();

    return _subject.stream;
  }

  void _loadUsers() {
    _loaded = true;

    _repository.loadUser().then((entities) {
      _subject.add(entities);
    });
  }

  @override
  Future<void> updateUser(User update) async {
    _subject.add(update);

    await _repository.saveUser(_subject.value);
  }
}
