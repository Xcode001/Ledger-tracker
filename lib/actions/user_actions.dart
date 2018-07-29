import 'package:vsii_trader/models/models.dart';

class LoadUserAction {}

class UserNotLoadedAction {}

class UserLoadedAction {
  final User user;

  UserLoadedAction(this.user);

  @override
  String toString() {
    return 'UserLoadedAction{user: $user}';
  }
}

class UpdateUserAction {
  final String id;
  final User updatedUser;

  UpdateUserAction(this.id, this.updatedUser);

  @override
  String toString() {
    return 'UpdateUserAction{id: $id, updatedUser: $updatedUser}';
  }
}

class AddUserAction {
  final User user;

  AddUserAction(this.user);

  @override
  String toString() {
    return 'AddUserAction{user: $user}';
  }
}
