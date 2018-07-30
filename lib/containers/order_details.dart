import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/order/details_screen.dart';
import 'package:vsii_trader/selectors/selectors.dart';
import 'package:vsii_trader/actions/order_actions.dart';

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
          order: vm.order,
          user: vm.user,
          onConfirm: vm.onConfirm,
        );
      },
    );
  }
}

class _ViewModel {
  final Order order;
  final User user;
  final Function onConfirm;

  _ViewModel({
    @required this.order,
    @required this.user,
    @required this.onConfirm,
  });

  factory _ViewModel.from(Store<AppState> store, String id) {
    final order = orderSelector(ordersSelector(store.state), id).value;
    final user = userSelector(store.state);

    return _ViewModel(
      order: order,
      user: user,
      onConfirm: () => _onConfirm(store, order, user),
//      toggleCompleted: (isComplete) {
//        store.dispatch(UpdateOrderAction(
//          order.id,
//          order.copyWith(complete: isComplete),
//        ));
//      },
    );
  }

  static void _onConfirm(Store<AppState> store, Order order, User user) {
    switch (order.status) {
      case 'NEW':
        return store.dispatch(SendInvoiceAction(order, user));
      case 'INVOICE_SENT':
        return store.dispatch(SendInvoiceAction(order, user));
      case 'INVOICE_RECEIVED':
        return store.dispatch(SendInvoiceAction(order, user));
      case 'PAYMENT_SENT':
        return store.dispatch(SendInvoiceAction(order, user));
      case 'PAYMENT_RECEIVED':
        return store.dispatch(SendInvoiceAction(order, user));
    }
  }
}
