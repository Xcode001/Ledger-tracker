import 'package:flutter/widgets.dart';

class ArchSampleKeys {
  // Home Screens
  static final homeScreen = const Key('__homeScreen__');
  static final addOrderFab = const Key('__addOrderFab__');
  static final snackbar = const Key('__snackbar__');
  static Key snackbarAction(String id) => Key('__snackbar_action_${id}__');

  // Orders
  static final orderList = const Key('__orderList__');
  static final ordersLoading = const Key('__ordersLoading__');
  static final orderItem = (String id) => Key('OrderItem__${id}');
  static final orderItemSupplier =
      (String id) => Key('OrderItem__${id}__Supplier');
  static final orderItemDescription =
      (String id) => Key('OrderItem__${id}__Description');
  static final orderItemQuantity =
      (String id) => Key('OrderItem__${id}__Quantity');
  static final orderItemTotalPrice =
      (String id) => Key('OrderItem__${id}__TotalPrice');
  static final orderItemStatus = (String id) => Key('OrderItem__${id}__Status');
  static final orderItemUpdateDate =
      (String id) => Key('OrderItem__${id}__UpdateDate');
  static final orderItemSpacer = (String id) => Key('OrderItem__${id}__Spacer');
  static final orderItemRow = (String id) => Key('OrderItem__${id}__Row');

  // Tabs
  static final tabs = const Key('__tabs__');
  static final orderTab = const Key('__orderTab__');
  static final statsTab = const Key('__statsTab__');

  // Extra Actions
  static final extraActionsButton = const Key('__extraActionsButton__');
  static final toggleAll = const Key('__markAllDone__');
  static final clearCompleted = const Key('__clearCompleted__');

  // Filters
  static final filterButton = const Key('__filterButton__');
  static final allFilter = const Key('__allFilter__');
  static final activeFilter = const Key('__activeFilter__');
  static final completedFilter = const Key('__completedFilter__');
  static final newRequestFilter = const Key('__newRequestFilter__');
  static final inProgressFilter = const Key('__inProgressFilter__');
  static final closedFilter = const Key('__closedFilter__');

  // Stats
  static final statsCounter = const Key('__statsCounter__');
  static final statsLoading = const Key('__statsLoading__');
  static final statsNumActive = const Key('__statsActiveItems__');
  static final statsNumCompleted = const Key('__statsCompletedItems__');
  static final statsNumNew = const Key('__statsNewItems__');
  static final statsNumInProgress = const Key('__statsInProgressItems__');
  static final statsNumClosed = const Key('__statsClosedItems__');

  // Details Screen
  static final detailsOrderItemId = Key('DetailsOrder__ID');
  static final detailsOrderItemStatus = Key('DetailsOrder__Status');
  static final detailsOrderItemSupplier = Key('DetailsOrder__Supplier');
  static final detailsOrderItemDescription = Key('DetailsOrder__Description');
  static final detailsOrderItemQuantity = Key('DetailsOrder__Quantity');
  static final detailsOrderItemUnit = Key('DetailsOrder__Unit');
  static final detailsOrderCurrency = Key('DetailsOrder__Currency');
  static final detailsOrderItemTotalPrice = Key('DetailsOrder__TotalPrice');
  static final detailsOrderUpdatedDate = Key('DetailsOrder__UpdatedDate');
  static final detailsOrderQuantityRow = Key('DetailsOrder__QuantityRow');
  static final detailsOrderTotalPriceRow = Key('DetailsOrder__TotalPriceRow');

  // Add Screen
  static final addOrderScreen = const Key('__addOrderScreen__');
  static final saveNewOrder = const Key('__saveNewOrder__');
}
