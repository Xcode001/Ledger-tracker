import 'package:vsii_trader/common/optional.dart';
import 'package:vsii_trader/models/models.dart';

List<Order> ordersSelector(AppState state) => state.orders;
User userSelector(AppState state) => state.user;

String selectedSupplierSelector(AppState state) => state.selectedSupplier;

VisibilityFilter activeFilterSelector(AppState state) => state.activeFilter;

AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;

bool allCompleteSelector(List<Order> orders) =>
    orders.every((order) => order.status == 'CLOSED');

int numNewSelector(List<Order> orders) =>
    orders.fold(0, (sum, order) => order.status == 'NEW' ? ++sum : sum);

int numInProgressSelector(List<Order> orders) => orders.fold(
    0, (sum, order) => inProgressStatus.contains(order.status) ? ++sum : sum);

int numClosedSelector(List<Order> orders) =>
    orders.fold(0, (sum, order) => order.status == 'CLOSED' ? ++sum : sum);

final List<String> inProgressStatus = [
  'INVOICE_SENT',
  'INVOICE_RECEIVED',
  'PAYMENT_SENT',
  'PAYMENT_RECEIVED',
];

List<Order> filteredOrdersSelector(
  List<Order> orders,
  User user,
  VisibilityFilter activeFilter,
) {
  final String userRs = user.role == 'Retailer'
      ? user.userClass + '#7727'
      : user.userClass + '#4696';
  return orders.where((item) {
    if (user.role == 'Retailer') {
      return item.retailer.contains(userRs);
    }
    if (user.role == 'Supplier') {
      return item.supplier.contains(userRs);
    }
  }).where((order) {
    if (activeFilter == VisibilityFilter.all) {
      return true;
    } else if (activeFilter == VisibilityFilter.newRequest) {
      return order.status == 'NEW';
    } else if (activeFilter == VisibilityFilter.inProgress) {
      return inProgressStatus.contains(order.status);
    } else if (activeFilter == VisibilityFilter.closed) {
      return order.status == 'CLOSED';
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
