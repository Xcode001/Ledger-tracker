import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:vsii_trader/models/user.dart';

class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(
    this.tag,
    this.getDirectory,
  );

  Future<User> loadUuser() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final user = (json['user']).map<User>((user) => User.fromJson(user));

    return user;
  }

  Future<File> saveUser(User user) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'user': user.toJson(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir.path}/UserStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}
