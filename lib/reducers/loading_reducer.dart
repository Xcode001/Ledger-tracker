import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/order_actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, OrdersLoadedAction>(_setLoaded),
  TypedReducer<bool, OrdersNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
