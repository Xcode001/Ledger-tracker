import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/reducers/loading_reducer.dart';
import 'package:vsii_trader/reducers/tabs_reducer.dart';
import 'package:vsii_trader/reducers/orders_reducer.dart';
import 'package:vsii_trader/reducers/user_reducer.dart';
import 'package:vsii_trader/reducers/visibility_reducer.dart';

// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    orders: ordersReducer(state.orders, action),
    user: userReducer(state.user, action),
    activeFilter: visibilityReducer(state.activeFilter, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}
