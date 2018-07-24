import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/order_actions.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/selectors/selectors.dart';
import 'package:vsii_trader/repository/orders/orders_index.dart';

List<Middleware<AppState>> createStoreOrdersMiddleware([
  OrdersRepository repository = const OrdersRepositoryFlutter(
    fileStorage: const FileStorage(
      '__redux_app__',
      getApplicationDocumentsDirectory,
    ),
  ),
]) {
  final saveOrders = _createSaveOrders(repository);
  final loadOrders = _createLoadOrders(repository);

  return [
    TypedMiddleware<AppState, LoadOrdersAction>(loadOrders),
    TypedMiddleware<AppState, AddOrderAction>(saveOrders),
    TypedMiddleware<AppState, UpdateOrderAction>(saveOrders),
    TypedMiddleware<AppState, OrdersLoadedAction>(saveOrders),
  ];
}

Middleware<AppState> _createSaveOrders(OrdersRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveOrders(
      ordersSelector(store.state).map((order) => order.toEntity()).toList(),
    );
  };
}

Middleware<AppState> _createLoadOrders(OrdersRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadOrders().then(
          (orders) {
        store.dispatch(
          OrdersLoadedAction(
            orders.map(Order.fromEntity).toList(),
          ),
        );
      },
    ).catchError((_) => store.dispatch(OrdersNotLoadedAction()));

    next(action);
  };
}
