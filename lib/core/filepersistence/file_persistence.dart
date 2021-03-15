import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FilePersistence {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<String> getFilename(String userId, String type, String key) async {
    return userId + '/' + type + '/' + key;
  }

  void saveObject(
      String userId, String key, Map<String, dynamic> object) async {
    final filename = await getFilename(userId, 'objects', key);
    final file = await _localFile(filename);

    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    final jsonString = JsonEncoder().convert(object);
    await file.writeAsString(jsonString);
  }

  void saveString(String userId, String key, String value) async {
    final filename = await getFilename(userId, 'strings', key);
    final file = await _localFile(filename);

    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    await file.writeAsString(value);
  }

  // _read() async {
  //   try {
  //     final directory = await getApplicationDocumentsDirectory();
  //     final file = File('${directory.path}/my_file.txt');
  //     String text = await file.readAsString();
  //     print(text);
  //   } catch (e) {
  //     print("Couldn't read file");
  //   }
  // }

  // _save() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/my_file.txt');
  //   final text = 'Hello World!';
  //   await file.writeAsString(text);
  //   print('saved');
  // }
}
