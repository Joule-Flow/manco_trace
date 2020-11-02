import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:manco_tracer/models/event.dart';

class ManageEvent extends StatefulWidget {
  @override
  _ManageEventState createState() => _ManageEventState();
}

class _ManageEventState extends State<ManageEvent> {
  Box _storage;
  Event _event;
  bool _init = false;

  bool hasBeenInitialized() {
    return this._init; // !! Not implemented
  }

  @override
  initState() {
    super.initState();
    getStorage();
  }

  getStorage() async {
    this._event = new Event(
        active: false, name: "new Event", startOfEvent: DateTime.now());

    setState(() {
      this._init = true;
    });
  }

  void endEvent() {
    this._event.endOfEvent = DateTime.now();

    this._storage.put('event', _event);
  }

  void dispose() {
    super.dispose();
    this._storage?.close();
  }

  void displayMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  validationProcessSuccessful() {
    return true;
  }

  saveData() async {
    if (validationProcessSuccessful()) {
      this._storage.put("event", this._event);
      displayMessage("Data has been saved.");
    } else {
      displayMessage("Validation failed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hasBeenInitialized()) {
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
