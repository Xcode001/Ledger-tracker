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
  TypedReducer<List<Order>, SendInvoiceAction>(_sendInvoice),
  TypedReducer<List<Order>, ReceiveInvoiceAction>(_receiveInvoice),
  TypedReducer<List<Order>, SendPaymentAction>(_sendPayment),
  TypedReducer<List<Order>, ReceivePaymentAction>(_receivePayment),
  TypedReducer<List<Order>, CloseOrderAction>(_closeOrder),
]);

List<Order> _sendInvoice(List<Order> orders, SendInvoiceAction action) {
  final OrdersRepository _orderRepository = new OrdersRepositoryFlutter();
  _orderRepository.sendInvoice(action.order, action.user);
  return List.from(orders);
}

List<Order> _receiveInvoice(List<Order> orders, ReceiveInvoiceAction action) {
  final OrdersRepository _orderRepository = new OrdersRepositoryFlutter();
  _orderRepository.receiveInvoice(action.order, action.user);
  return List.from(orders);
}

List<Order> _sendPayment(List<Order> orders, SendPaymentAction action) {
  final OrdersRepository _orderRepository = new OrdersRepositoryFlutter();
  _orderRepository.sendPayment(action.order, action.user);
  return List.from(orders);
}

List<Order> _receivePayment(List<Order> orders, ReceivePaymentAction action) {
  final OrdersRepository _orderRepository = new OrdersRepositoryFlutter();
  _orderRepository.receivePayment(action.order, action.user);
  return List.from(orders);
}

List<Order> _closeOrder(List<Order> orders, CloseOrderAction action) {
  final OrdersRepository _orderRepository = new OrdersRepositoryFlutter();
  _orderRepository.closeOrder(action.order, action.user);
  return List.from(orders);
}

List<Order> _addOrder(List<Order> orders, AddOrderAction action) {
  final OrdersRepository _orderRepository = new OrdersRepositoryFlutter();
  _orderRepository.saveOrder(action.order);
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
