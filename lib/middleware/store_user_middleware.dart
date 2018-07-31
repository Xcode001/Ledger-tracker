import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/user_actions.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/selectors/selectors.dart';
import 'package:vsii_trader/repository/users/users_index.dart';

List<Middleware<AppState>> createStoreUserMiddleware([
  UserRepository repository = const UserRepositoryFlutter(
    fileStorage: const FileStorage(
      '__redux_app__user__',
      getApplicationDocumentsDirectory,
    ),
  ),
]) {
  final saveUser = _createSaveUser(repository);
  final loadUser = _createLoadUser(repository);

  return [
    TypedMiddleware<AppState, LoadUserAction>(loadUser),
    TypedMiddleware<AppState, AddUserAction>(saveUser),
    TypedMiddleware<AppState, UpdateUserAction>(saveUser),
    TypedMiddleware<AppState, UserLoadedAction>(saveUser),
  ];
}

Middleware<AppState> _createSaveUser(UserRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveUser(
      userSelector(store.state),
    );
  };
}

Middleware<AppState> _createLoadUser(UserRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadUser().then(
      (user) {
        store.dispatch(
          UserLoadedAction(
            user,
          ),
        );
      },
    ).catchError((_) => store.dispatch(UserNotLoadedAction()));

    next(action);
  };
}
