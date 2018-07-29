import 'package:vsii_trader/common/environment.dart';

class Router {
  static final String SERVER_ENDPOINT = Environment.PROD_NETWORK_API;
  static final String SERVER_ENDPOINT_URL = Environment.PROD_NETWORK_API_URL;

  //Order
  static final String ORDER_ENDPOINT = SERVER_ENDPOINT + '/api/Order';
  static final String ORDER_ENDPOINT_URL = SERVER_ENDPOINT_URL + '/api/Order';

  Router();
}
