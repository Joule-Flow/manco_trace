import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainAppBody extends StatefulWidget {
  @override
  _MainAppBodyState createState() => _MainAppBodyState();
}

class _MainAppBodyState extends State<MainAppBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ManCo Home"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ContactEdit');
                    },
                    child: const Text('Kontaktdaten Anpassen'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/QRReader');
                    },
                    child: const Text("QR Scanner"),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Report');
                    },
                    child: const Text("Report"),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/manageEvent');
                      },
                      child: const Text('manageEvent'),
                      color: Colors.blue,
                      textColor: Colors.white),
                  RaisedButton(
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: "MancoTracer",
                            applicationVersion: "0.0.1",
                            applicationLegalese: "Text Bla Blub",
                            applicationIcon: Image(
                                image:
                                    AssetImage('assets/images/mancologo.png'),
                                width: 40));
                      },
                      child: const Text('Help'),
                      color: Colors.blue,
                      textColor: Colors.white),
                  RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/privacyNotice');
                      },
                      child: const Text('PrivacyNotice'),
                      color: Colors.blue,
                      textColor: Colors.white),
                  RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ContactExportQR');
                      },
                      child: const Text('Export QR Code'),
                      color: Colors.blue,
                      textColor: Colors.white)
                ])));
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
