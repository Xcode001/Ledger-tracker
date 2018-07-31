import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/order_actions.dart';
import 'package:vsii_trader/actions/user_actions.dart';
import 'package:vsii_trader/containers/add_order.dart';
import 'package:vsii_trader/localization.dart';
import 'package:vsii_trader/middleware/store_orders_middleware.dart';
import 'package:vsii_trader/middleware/store_user_middleware.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/home_screen.dart';
import 'package:vsii_trader/presentation/choose_role_screen.dart';
import 'package:vsii_trader/reducers/app_state_reducer.dart';

void main() {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;

  runApp(ReduxApp());
}

List<Middleware<AppState>> listMiddleWare = new List<Middleware<AppState>>();

class ReduxApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: listMiddleWare
      ..addAll(createStoreUserMiddleware())
      ..addAll(createStoreOrdersMiddleware()),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: ReduxLocalizations().appTitle,
        theme: ArchSampleTheme.theme,
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
          ReduxLocalizationsDelegate(),
        ],
        routes: {
          ArchSampleRoutes.home: (context) {
            return StoreBuilder<AppState>(
              onInit: (store) => _preLoad(store),
              builder: (context, store) {
                return ChooseRoleScreen();
              },
            );
          },
          ArchSampleRoutes.addOrder: (context) {
            return AddOrder();
          },
        },
      ),
    );
  }

  void _preLoad(Store<AppState> store) {
    store.dispatch(LoadUserAction());
    store.dispatch(LoadOrdersAction());
  }
}
