import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:vsii_trader/repository/orders/order_entity.dart';

/// Loads and saves a List of Orders using a text file stored on the device.
class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(
    this.tag,
    this.getDirectory,
  );

  Future<List<OrderEntity>> loadOrders() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final orders = (json['orders'])
        .map<OrderEntity>((order) => OrderEntity.fromJson(order))
        .toList();

    return orders;
  }

  Future<File> saveOrders(List<OrderEntity> orders) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'orders': orders.map((order) => order.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir.path}/ArchSampleStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}
