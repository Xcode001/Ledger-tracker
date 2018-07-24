import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/models/models.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final bool visible;

  FilterButton({this.onSelected, this.activeFilter, this.visible, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle = Theme
        .of(context)
        .textTheme
        .body1
        .copyWith(color: Theme.of(context).accentColor);

    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 150),
      child: PopupMenuButton<VisibilityFilter>(
        key: ArchSampleKeys.filterButton,
        tooltip: ArchSampleLocalizations.of(context).filterOrders,
        onSelected: onSelected,
        itemBuilder: (BuildContext context) =>
            <PopupMenuItem<VisibilityFilter>>[
              PopupMenuItem<VisibilityFilter>(
                key: ArchSampleKeys.allFilter,
                value: VisibilityFilter.all,
                child: Text(
                  ArchSampleLocalizations.of(context).showAll,
                  style: activeStyle,
//                  style: activeFilter == VisibilityFilter.all
//                      ? activeStyle
//                      : defaultStyle,
                ),
              ),
              PopupMenuItem<VisibilityFilter>(
                key: ArchSampleKeys.newRequestFilter,
                value: VisibilityFilter.newRequest,
                child: Text(
                  ArchSampleLocalizations.of(context).showNewRequest,
                  style: activeStyle,
//                  style: activeFilter == VisibilityFilter.newRequest
//                      ? activeStyle
//                      : defaultStyle,
                ),
              ),
              PopupMenuItem<VisibilityFilter>(
                key: ArchSampleKeys.inProgressFilter,
                value: VisibilityFilter.inProgress,
                child: Text(
                  ArchSampleLocalizations.of(context).showInProgress,
                  style: activeStyle,
//                  style: activeFilter == VisibilityFilter.completed
//                      ? activeStyle
//                      : defaultStyle,
                ),
              ),
              PopupMenuItem<VisibilityFilter>(
                key: ArchSampleKeys.closedFilter,
                value: VisibilityFilter.closed,
                child: Text(
                  ArchSampleLocalizations.of(context).showClosed,
                  style: activeStyle,
//                  style: activeFilter == VisibilityFilter.completed
//                      ? activeStyle
//                      : defaultStyle,
                ),
              ),
            ],
        icon: Icon(Icons.filter_list),
      ),
    );
  }
}
