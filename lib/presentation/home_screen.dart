import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/containers/active_tab.dart';
import 'package:vsii_trader/containers/extra_actions_container.dart';
import 'package:vsii_trader/containers/filter_selector.dart';
import 'package:vsii_trader/containers/filtered_orders.dart';
import 'package:vsii_trader/containers/choose_role.dart';
import 'package:vsii_trader/containers/stats.dart';
import 'package:vsii_trader/containers/tab_selector.dart';
import 'package:vsii_trader/localization.dart';
import 'package:vsii_trader/models/models.dart';

class HomeScreen extends StatelessWidget {
  final String userRole;
  HomeScreen(this.userRole) : super(key: ArchSampleKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(ReduxLocalizations.of(context).appTitle),
            actions: [
              FilterSelector(visible: activeTab == AppTab.orders),
              ExtraActionsContainer(),
            ],
          ),
          body: activeTab == AppTab.orders ? FilteredOrders() : Stats(),
          floatingActionButton: FloatingActionButton(
            key: ArchSampleKeys.addOrderFab,
            onPressed: () {
              userRole == 'Retailer'
                  ? Navigator.pushNamed(context, ArchSampleRoutes.addOrder)
                  : null;
            },
            child: Icon(Icons.add),
            tooltip: ArchSampleLocalizations.of(context).addOrder,
          ),
          bottomNavigationBar: TabSelector(),
        );
      },
    );
  }
}
