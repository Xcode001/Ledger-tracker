import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/stats_counter.dart';
import 'package:vsii_trader/selectors/selectors.dart';

class Stats extends StatelessWidget {
  Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return StatsCounter(
          numNew: vm.numNew,
          numInProgress: vm.numInProgress,
          numClosed: vm.numClosed,
        );
      },
    );
  }
}

class _ViewModel {
  final int numNew;
  final int numInProgress;
  final int numClosed;

  _ViewModel(
      {@required this.numNew,
      @required this.numInProgress,
      @required this.numClosed});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      numNew: numNewSelector(ordersSelector(store.state)),
      numInProgress: numInProgressSelector(ordersSelector(store.state)),
      numClosed: numClosedSelector(ordersSelector(store.state)),
    );
  }
}
