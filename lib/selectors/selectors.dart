import 'package:vsii_trader/common/optional.dart';
import 'package:vsii_trader/models/models.dart';

List<Order> ordersSelector(AppState state) => state.orders;

VisibilityFilter activeFilterSelector(AppState state) => state.activeFilter;

AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;

bool allCompleteSelector(List<Order> orders) =>
    orders.every((order) => order.status == 'Closed');

int numNewSelector(List<Order> orders) =>
    orders.fold(0, (sum, order) => order.status == 'New Request' ? ++sum : sum);

int numInProgressSelector(List<Order> orders) => orders.fold(
    0,
    (sum, order) => order.status == 'Delivering' || order.status == 'Invoicing'
        ? ++sum
        : sum);

int numClosedSelector(List<Order> orders) =>
    orders.fold(0, (sum, order) => order.status == 'Closed' ? ++sum : sum);

List<Order> filteredOrdersSelector(
  List<Order> orders,
  VisibilityFilter activeFilter,
) {
  return orders.where((order) {
    if (activeFilter == VisibilityFilter.all) {
      return true;
    } else if (activeFilter == VisibilityFilter.newRequest) {
      return order.status == 'New Request';
    } else if (activeFilter == VisibilityFilter.inProgress) {
      return order.status == 'Delivering' || order.status == 'Invoicing';
    } else if (activeFilter == VisibilityFilter.closed) {
      return order.status == 'Closed';
    }
  }).toList();
}

Optional<Order> orderSelector(List<Order> orders, String id) {
  try {
    return Optional.of(orders.firstWhere((order) => order.id == id));
  } catch (e) {
    return Optional.absent();
  }
}
