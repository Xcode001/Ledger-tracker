import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/user/role_list.dart';
import 'package:vsii_trader/selectors/selectors.dart';

class ChooseRole extends StatelessWidget {
  ChooseRole({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return UserList(user: vm.user);
      },
    );
  }
}

class _ViewModel {
  final User user;
  final bool loading;

  _ViewModel({
    @required this.user,
    @required this.loading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      user: userSelector(store.state),
      loading: store.state.isLoading,
    );
  }
}
