import 'package:flutter/material.dart';
import 'package:manco_tracer/models/address.dart';
import 'package:manco_tracer/models/person.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manco_tracer/components/contact/contact.dart';
import 'package:manco_tracer/services/storage/settingsStorage.dart';

class PersonEdit extends StatefulWidget {
  @override
  _PersonEditState createState() => _PersonEditState();
}

class _PersonEditState extends State<PersonEdit> {
  SettingsStorage _storage;
  Person _person;
  bool _init = false;

  getstorage() async {
    this._storage = SettingsStorage();
    this._person = await this._storage.getUser() ??
        new Person(
          address: Address(),
        );
    setState(() {
      // Workaround because Initstate cant contain await.
      this._init = true;
    });
  }

  @override
  initState() {
    super.initState();
    getstorage();
  }

  void dispose() {
    super.dispose();
    this._storage?.dispose();
  }

  saveData() async {
    if (this._person.birthday == null) {
      Fluttertoast.showToast(
          msg:
              "Bitte Geburtstag Eingeben, damit der QR Code Verschlüsselt werden kann",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      if (this._person.lastName == null || this._person.lastName == "") {
        Fluttertoast.showToast(
            msg:
                "Bitte Nachnamen Eingeben, damit der QR Code Verschlüsselt werden kann",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        this._storage.setUser(this._person);
        Fluttertoast.showToast(
            msg: "Daten gespeichert",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this._init)
      return Scaffold(
          appBar: AppBar(
            title: Text("Kontaktdaten"),
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ContactInfo(contactmodel: this._person, readonly: false),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    saveData();
                  },
                  child: Text(
                    'Speichern',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ]));
    return CircularProgressIndicator();
  }
}
