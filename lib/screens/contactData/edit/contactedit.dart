import 'package:flutter/material.dart';
import 'package:manco_tracer/models/address.dart';
import 'package:manco_tracer/models/person.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manco_tracer/components/contact/contact.dart';
import 'package:manco_tracer/services/storage/settings.dart';

class ContactEdit extends StatefulWidget {
  @override
  _ContactEditState createState() => _ContactEditState();
}

class _ContactEditState extends State<ContactEdit> {
  SettingsStorage _storage;
  Person _contact;
  bool _init = false;

  getstorage() async {
    this._storage = SettingsStorage();
    this._contact = await this._storage.getUser() ??
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
    if (this._contact.birthday == null) {
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
      if (this._contact.lastName == null || this._contact.lastName == "") {
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
        this._storage.setUser(this._contact);
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
            ContactInfo(contactmodel: this._contact, readonly: false),
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
