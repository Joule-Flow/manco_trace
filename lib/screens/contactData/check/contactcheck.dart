import 'package:flutter/material.dart';
import 'package:manco_tracer/models/person.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manco_tracer/screens/readcontact/encrypted/qr_reader.dart';
import '../../../components/contact/contact.dart';

class ContactCheck extends StatefulWidget {
  final Person contactmodel;
  ContactCheck({Key key, @required this.contactmodel}) : super(key: key);
  @override
  _ContactCheckState createState() => _ContactCheckState();
}

class _ContactCheckState extends State<ContactCheck> {
  @override
  initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  saveData() async {
    // ! Implement some sort of Validation and save method
    Fluttertoast.showToast(
        msg: "notImplemented",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  declineData() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => QRReader()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kontaktdaten Checken"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ContactInfo(contactmodel: widget.contactmodel, readonly: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    saveData();
                  },
                  child: Text(
                    'Speichern',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    declineData();
                  },
                  child: Text(
                    'Ablehnen',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
