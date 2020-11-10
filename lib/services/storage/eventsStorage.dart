import 'package:hive/hive.dart';
import 'package:manco_tracer/models/event.dart';
import 'encryption.dart';
import 'package:manco_tracer/models/contact.dart';

class EventsStorage {
  Box _connection;

  Future _init() async {
    if (_connection == null) {
      _connection = await openEncryptedStorage("events", "eventsEncKey");
    }
  }

  void dispose() {
    if (_connection != null) {
      _connection.close();
    }
  }

  HiveList _eventStorage() {
    HiveList _store = this._connection.get('events');
    return _store ?? HiveList(this._connection);
  }

  Future<List> getAllEvent(String eventKey) async {
    await _init();
    return _eventStorage().toList();
  }

  Future<void> addEvent(Event event) async {
    await _init();
    this._connection.add(event);
    _eventStorage().add(
        event); //Add Event to events list. Should automatically updated due to HiveList type.
  }

  Future<void> addContact(Contact contact) async {
    await _init();
    this._connection.add(contact);
  }
}
