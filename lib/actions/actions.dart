import 'package:vsii_trader/models/models.dart';

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

class UpdateSelectedRetailerAction {
  final String value;

  UpdateSelectedRetailerAction(this.value);

  @override
  String toString() {
    return 'UpdateSelectedRetailerAction{value: $value}';
  }
}
