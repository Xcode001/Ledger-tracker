import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/selectors/selectors.dart';

class AppLoading extends StatelessWidget {
  final Function(BuildContext context, bool isLoading) builder;

  AppLoading({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (Store<AppState> store) => isLoadingSelector(store.state),
      builder: builder,
    );
  }
}
