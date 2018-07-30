import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/actions.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/dropdown_button.dart';

class DropDownSelector extends StatelessWidget {
  DropDownSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return DropDownButton(
          onSelected: vm.onDropDownSelected,
          value: 'VSII',
        );
      },
    );
  }
}

class _ViewModel {
  final Function(String value) onDropDownSelected;
//  final String value;

  _ViewModel({
    @required this.onDropDownSelected,
//    @required this.value,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onDropDownSelected: (selectedValue) {
        store.dispatch(UpdateSelectedRetailerAction(selectedValue));
      },
//      value: selectedSupplierSelector(store.state),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          onDropDownSelected == other.onDropDownSelected;

  @override
  int get hashCode => onDropDownSelected.hashCode;
}
