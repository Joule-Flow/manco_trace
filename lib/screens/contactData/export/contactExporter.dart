import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:manco_tracer/models/person.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:manco_tracer/models/transfer.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:intl/intl.dart';
import 'package:manco_tracer/services/storage/settings.dart';

class ContactExportQR extends StatefulWidget {
  @override
  _ContactExportQRState createState() => _ContactExportQRState();
}

class _ContactExportQRState extends State<ContactExportQR> {
  SettingsStorage _storage;
  Person _contact;
  String qrExport;
  final cryptor = new PlatformStringCryptor();

  getstorage() async {
    this._storage = SettingsStorage();
    this._contact = await this._storage.getUser();
    encryptQR();
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

  encryptQR() async {
    if (this._contact?.birthday != null) {
      String password = this._contact.lastName +
          DateFormat('ddMMyyyy').format(this._contact.birthday);
      String salt = await cryptor.generateSalt();
      String key = await cryptor.generateKeyFromPassword(password, salt);
      TransferData qrOut = new TransferData();
      String encrypted =
          await cryptor.encrypt(jsonEncode(this._contact.toJson()), key);
      qrOut
        ..data = encrypted
        ..version = "0.1"
        ..vali = salt;
      String qrOutStr = jsonEncode(qrOut.toJson());
      setState(() {
        // Workaround because Initstate cant contain await.
        this.qrExport = qrOutStr;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontakt Senden"),
      ),
      body: Container(
        child: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) {
              return this.qrExport != null;
            },
            widgetBuilder: (BuildContext context) {
              // the widget is created only when we need to render it,
              // while maintaining good readability.
              return Center(
                child: QrImage(
                  data: this.qrExport,
                  version: QrVersions.auto,
                  // size: 200.0,
                  embeddedImage: AssetImage('assets/images/mancologo.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(80, 80),
                  ),
                ),
              );
            },
            fallbackBuilder: (BuildContext context) {
              return Center(
                child: Text(
                  'Es muss mindestens ein Nachname und ein Geburtsdatum hinterlegt sein!',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
