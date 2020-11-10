import 'package:hive/hive.dart';
import 'encryption.dart';
import 'package:manco_tracer/models/person.dart';

class SettingsStorage {
  Box _connection;

  Future _init() async {
    if (_connection == null) {
      _connection = await openEncryptedStorage("settings", "settingsEncKey");
    }
  }

  void dispose() {
    if (_connection != null) {
      _connection.close();
    }
  }

  // ########## Appuser Data ##########
  Future<Person> getUser() async {
    await _init();
    return this._connection.get('user');
  }

  Future<void> setUser(Person value) async {
    await _init();
    this._connection.put('user', value);
  }
  // ########## Appuser Data ##########

  // ########## Local Healthorg ##########
  Future<String> getLocalHealthOrgEndpointURL() async {
    await _init();
    return this._connection.get("healthOrganizationApiEndPointURL");
  }

  Future<void> setLocalHealthOrgEndpointURL(String value) async {
    return this._connection.put("healthOrganizationApiEndPointURL", value);
  }
  // ########## Local Healthorg ##########
}
