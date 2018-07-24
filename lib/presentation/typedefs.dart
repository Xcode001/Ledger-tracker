import 'package:vsii_trader/models/models.dart';

typedef OrderAdder(Order order);

typedef OrderRemover(String id);

typedef OrderUpdater(String id, Order order);
