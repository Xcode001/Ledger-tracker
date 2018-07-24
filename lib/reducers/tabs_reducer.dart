import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/actions.dart';
import 'package:vsii_trader/models/models.dart';

final tabsReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) {
  return action.newTab;
}
