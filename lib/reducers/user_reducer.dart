import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/user_actions.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/repository/users/user_repository.dart';
import 'package:vsii_trader/repository/users/user_repository_imp.dart';
import 'package:vsii_trader/models/user.dart';
import 'package:vsii_trader/selectors/selectors.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, AddUserAction>(_addUser),
//  TypedReducer<User, UpdateUserAction>(_updateUser),
  TypedReducer<User, UserLoadedAction>(_setLoadedUser),
//  TypedReducer<User, UserNotLoadedAction>(_setNoUser),
]);

User _addUser(User user, AddUserAction action) {
  final UserRepository _userRepository = new UserRepositoryFlutter();
//  User tmp = User(role: action.user.role);
//  _userRepository.saveUser(tmp);
  return action.user;
}

//User _updateUser(User user, UpdateUserAction action) {
//  return user
//      .map((user) => user.id == action.id ? action.updatedUser : user)
//      .toList();
//}

User _setLoadedUser(User user, UserLoadedAction action) {
  return action.user;
}

//User _setNoUser(User user, UserNotLoadedAction action) {
//  return [];
//}
