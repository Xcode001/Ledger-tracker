import 'package:meta/meta.dart';
import 'package:vsii_trader/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Order> orders;
  final User user;
  final AppTab activeTab;
  final String selectedSupplier;
  final VisibilityFilter activeFilter;

  AppState(
      {this.isLoading = false,
      this.orders = const [],
      this.user,
      this.selectedSupplier,
      this.activeTab = AppTab.orders,
      this.activeFilter = VisibilityFilter.all});

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<Order> orders,
    User user,
    String selectedSupplier,
    AppTab activeTab,
    VisibilityFilter activeFilter,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      orders: orders ?? this.orders,
      user: user ?? this.user,
      selectedSupplier: selectedSupplier ?? this.selectedSupplier,
      activeTab: activeTab ?? this.activeTab,
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      orders.hashCode ^
      user.hashCode ^
      selectedSupplier.hashCode ^
      activeTab.hashCode ^
      activeFilter.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          orders == other.orders &&
          user == other.user &&
          selectedSupplier == other.selectedSupplier &&
          activeTab == other.activeTab &&
          activeFilter == other.activeFilter;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, orders: $orders, user: $user, selectedSupplier: $selectedSupplier, activeTab: $activeTab, activeFilter: $activeFilter}';
  }
}
