import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/actions.dart';

final selectedRetailerReducer = combineReducers<String>([
  TypedReducer<String, UpdateSelectedRetailerAction>(_setSelectedRetailer),
]);

String _setSelectedRetailer(String value, UpdateSelectedRetailerAction action) {
  return action.value;
}
