import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:vsii_trader/common/environment.dart';

class Router {
  static final String SERVER_ENDPOINT = Environment.PROD_NETWORK_API;
  //Order
  static final String ORDER_PATH = '/api/Order';
  static final String ORDER_ENDPOINT = SERVER_ENDPOINT + '/api/Order';
  static final String SEND_INVOICE_PATH = '/api/SendInvoice';
  static final String RECEIVE_INVOICE_PATH = '/api/ReceiveInvoice';
  static final String SEND_PAYMENT_PATH = '/api/SendPayment';
  static final String RECEIVE_PAYMENT_PATH = '/api/ReceivePayment';
  static final String CLOSE_ORDER_PATH = '/api/CloseOrder';

  Router();
}

class RouterClient {
  static final String SERVER_ENDPOINT_IP = Environment.PROD_NETWORK_API_IP;
  static final int SERVER_ENDPOINT_PORT = Environment.PROD_NETWORK_API_PORT;

  RouterClient();

  static Future<HttpClientResponse> request(path, data) async {
    HttpClientRequest request = await new HttpClient()
        .post(SERVER_ENDPOINT_IP, SERVER_ENDPOINT_PORT, path)
      ..headers.contentType = ContentType.JSON
      ..write(json.encode(data));
    return request.close();
  }
}
