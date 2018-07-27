import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/order_actions.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/repository/orders/orders_repository.dart';
import 'package:vsii_trader/repository/orders/orders_repository_imp.dart';
import 'package:vsii_trader/repository/orders/order_entity.dart';
import 'package:vsii_trader/selectors/selectors.dart';

final ordersReducer = combineReducers<List<Order>>([
  TypedReducer<List<Order>, AddOrderAction>(_addOrder),
  TypedReducer<List<Order>, UpdateOrderAction>(_updateOrder),
  TypedReducer<List<Order>, OrdersLoadedAction>(_setLoadedOrders),
  TypedReducer<List<Order>, OrdersNotLoadedAction>(_setNoOrders),
]);

List<Order> _addOrder(List<Order> orders, AddOrderAction action) {
  final OrdersRepository _orderRepository = new OrdersRepositoryFlutter();
  _orderRepository.saveOrder(OrderEntity(
      action.order.id,
      action.order.supplier,
      action.order.retailer,
      action.order.desciption,
      action.order.quanity,
      action.order.totalPrice,
      action.order.status,
      action.order.updatedDate));
  return List.from(orders)..add(action.order);
}

List<Order> _updateOrder(List<Order> orders, UpdateOrderAction action) {
  return orders
      .map((order) => order.id == action.id ? action.updatedOrder : order)
      .toList();
}

List<Order> _setLoadedOrders(List<Order> orders, OrdersLoadedAction action) {
  return action.orders;
}

List<Order> _setNoOrders(List<Order> orders, OrdersNotLoadedAction action) {
  return [];
}
