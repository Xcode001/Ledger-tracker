import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/containers/app_loading.dart';
import 'package:vsii_trader/presentation/loading_indicator.dart';

class StatsCounter extends StatelessWidget {
  final int numNew;
  final int numInProgress;
  final int numClosed;

  StatsCounter({
    @required this.numNew,
    @required this.numInProgress,
    @required this.numClosed,
  });

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      return _buildStats(context);
//      return loading
//          ? LoadingIndicator(key: Key('__statsLoading__'))
//          : _buildStats(context);
    });
  }

  Widget _buildStats(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ArchSampleLocalizations.of(context).newOrders,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              "$numNew",
              key: ArchSampleKeys.statsNumNew,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ArchSampleLocalizations.of(context).inProgress,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              "$numInProgress",
              key: ArchSampleKeys.statsNumInProgress,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ArchSampleLocalizations.of(context).closedOrders,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              '$numClosed',
              key: ArchSampleKeys.statsNumClosed,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
        ],
      ),
    );
  }
}
