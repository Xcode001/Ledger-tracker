import 'package:vsii_trader/common/environment.dart';

class Router {
  static final String SERVER_ENDPOINT = Environment.PROD_NETWORK_API;

  //Order
  static final String ORDER_ENDPOINT = SERVER_ENDPOINT + '/api/Order';

  Router();
}
