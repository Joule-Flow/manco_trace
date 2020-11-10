import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:manco_tracer/models/event.dart';
import 'package:manco_tracer/services/storage/eventsStorage.dart';

class ManageEvent extends StatefulWidget {
  @override
  _ManageEventState createState() => _ManageEventState();
}

class _ManageEventState extends State<ManageEvent> {
  EventsStorage _storage;
  Event _event;
  bool _init = false;

  @override
  initState() {
    super.initState();
    getStorage();
  }

  getStorage() async {
    this._event = new Event(name: "new Event", startOfEvent: DateTime.now());
    this._storage = EventsStorage();
    setState(() {
      this._init = true;
    });
  }

  void endEvent() {
    this._event.endOfEvent = DateTime.now();
  }

  void dispose() {
    super.dispose();
  }

  void displayMessage(String message, [MaterialColor color = Colors.red]) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  validateEvent(Event event) {
    return true;
  }

  saveData() async {
    Event event = Event(name: 'Testevent01');
    if (validateEvent(event)) {
      this._storage.addEvent(event);
      displayMessage("Data has been saved.", Colors.green);
    } else {
      displayMessage("Validation failed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this._init) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Event MGMT"),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("EventName"),
                  Text("activate"),
                  Text("address"),
                  Text("startOfEvent"),
                  Text("endOfEvent")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        saveData();
                      },
                      child: Text('Save'))
                ],
              )
            ],
          ));
    } else {
      return CircularProgressIndicator();
    }
  }
}
