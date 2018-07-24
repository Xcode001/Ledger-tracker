import 'package:vsii_trader/models/models.dart';

class LoadOrdersAction {}

class OrdersNotLoadedAction {}

class OrdersLoadedAction {
  final List<Order> orders;

  OrdersLoadedAction(this.orders);

  @override
  String toString() {
    return 'OrdersLoadedAction{orders: $orders}';
  }
}

class UpdateOrderAction {
  final String id;
  final Order updatedOrder;

  UpdateOrderAction(this.id, this.updatedOrder);

  @override
  String toString() {
    return 'UpdateOrderAction{id: $id, updatedOrder: $updatedOrder}';
  }
}

class AddOrderAction {
  final Order order;

  AddOrderAction(this.order);

  @override
  String toString() {
    return 'AddOrderAction{order: $order}';
  }
}

class UpdateFilterAction {
  final VisibilityFilter newFilter;

  UpdateFilterAction(this.newFilter);

  @override
  String toString() {
    return 'UpdateFilterAction{newFilter: $newFilter}';
  }
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}
