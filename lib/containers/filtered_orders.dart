import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/order/order_list.dart';
import 'package:vsii_trader/selectors/selectors.dart';

class FilteredOrders extends StatelessWidget {
  FilteredOrders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return OrderList(orders: vm.orders);
      },
    );
  }
}

class _ViewModel {
  final List<Order> orders;
  final bool loading;

  _ViewModel({
    @required this.orders,
    @required this.loading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      orders: filteredOrdersSelector(
        ordersSelector(store.state),
        userSelector(store.state),
        activeFilterSelector(store.state),
      ),
      loading: store.state.isLoading,
    );
  }
}
