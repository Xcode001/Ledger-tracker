//import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:redux/redux.dart';
//import 'package:vsii_trader/actions/actions.dart';
//import 'package:vsii_trader/models/models.dart';
//import 'package:vsii_trader/presentation/confirm_button.dart';
//
//class ConfirmSelector extends StatelessWidget {
//  final bool visible;
//
//  ConfirmSelector({Key key, @required this.visible}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return StoreConnector<AppState, _ViewModel>(
//      distinct: true,
//      converter: _ViewModel.fromStore,
//      builder: (context, vm) {
//        return ConfirmButton(
//          visible: visible,
//          activeConfirm: vm.activeConfirm,
//          onSelected: vm.onConfirmSelected,
//        );
//      },
//    );
//  }
//}
//
//class _ViewModel {
//  final Function(VisibilityConfirm) onConfirmSelected;
//  final VisibilityConfirm activeConfirm;
//
//  _ViewModel({
//    @required this.onConfirmSelected,
//    @required this.activeConfirm,
//  });
//
//  static _ViewModel fromStore(Store<AppState> store) {
//    return _ViewModel(
//      onConfirmSelected: (filter) {
//        store.dispatch(UpdateConfirmAction(filter));
//      },
//      activeConfirm: store.state.activeConfirm,
//    );
//  }
//
//  @override
//  bool operator ==(Object other) =>
//      identical(this, other) ||
//      other is _ViewModel &&
//          runtimeType == other.runtimeType &&
//          activeConfirm == other.activeConfirm;
//
//  @override
//  int get hashCode => activeConfirm.hashCode;
//}
