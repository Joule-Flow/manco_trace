import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'dart:typed_data';

var logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);

Future<Uint8List> getEncryptionKey(String keyName) async {
  // Create storage
  final storage = new FlutterSecureStorage();

  // Read value
  String value;

  try {
    value = await storage.read(key: keyName);
  } catch (e) {
    logger.i("Couldn't get secure key for: " + keyName);
  }
  if (value == null) {
    logger.i("generating new secure key for: " + keyName);
    value = Hive.generateSecureKey().join(',');
    storage.write(key: keyName, value: value);
  }
  return Uint8List.fromList(value.split(',').map(int.parse).toList());
}

Future<Box> openEncryptedStorage(String name, String encKeyName) async {
  Uint8List encKey = await getEncryptionKey(encKeyName);
  Box myBox;
  try {
    myBox = await Hive.openBox(name, encryptionKey: encKey,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 5;
    });
  } catch (e) {
    logger.e("Couldn't open Encrypted storage: " + name);
    Hive.deleteBoxFromDisk(name);

    myBox = await Hive.openBox(name, encryptionKey: encKey,
        compactionStrategy: (entries, deletedEntries) {
      return deletedEntries > 5;
    });
    logger.i("Generated new encrypted storage: " + name);
  }

  return myBox;
}
