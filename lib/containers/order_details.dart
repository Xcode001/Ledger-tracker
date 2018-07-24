import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/order/details_screen.dart';
import 'package:vsii_trader/selectors/selectors.dart';

class OrderDetails extends StatelessWidget {
  final String id;

  OrderDetails({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      ignoreChange: (state) => orderSelector(state.orders, id).isNotPresent,
      converter: (Store<AppState> store) {
        return _ViewModel.from(store, id);
      },
      builder: (context, vm) {
        return DetailsScreen(
          order: vm.order
        );
      },
    );
  }
}

class _ViewModel {
  final Order order;

  _ViewModel({
    @required this.order,
  });

  factory _ViewModel.from(Store<AppState> store, String id) {
    final order = orderSelector(ordersSelector(store.state), id).value;

    return _ViewModel(
      order: order,
//      toggleCompleted: (isComplete) {
//        store.dispatch(UpdateOrderAction(
//          order.id,
//          order.copyWith(complete: isComplete),
//        ));
//      },
    );
  }
}
