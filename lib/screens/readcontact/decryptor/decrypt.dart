import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manco_tracer/models/person.dart';
import 'package:manco_tracer/models/transfer.dart';
import 'package:manco_tracer/screens/personData/check/personcheck.dart';

class DecryptScreen extends StatefulWidget {
  final String value;

  DecryptScreen({Key key, @required this.value}) : super(key: key);

  @override
  _DecryptorState createState() => _DecryptorState();
}

class _DecryptorState extends State<DecryptScreen> {
  TextEditingController passwordcontroller = TextEditingController();
  final cryptor = new PlatformStringCryptor();
  TransferData input;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datensatz Entschlüsseln"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text(
              "Bitte geben Sie ihr Passwort ein um den Datensatz zu entsperren."),
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Passwort (NachnameGeburtstag)',
                  ),
                ),
              )),
          ElevatedButton(
            onPressed: () => {decrypt(passwordcontroller.text)},
            child: Text(
              'Entschlüsseln',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false)
            },
            child: Text(
              'Back Home',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  decrypt(String password) async {
    Map jsonData = json.decode(widget.value);
    this.input = TransferData.fromJson(jsonData);
    String key =
        await cryptor.generateKeyFromPassword(password, this.input.vali);
    if (password != "")
      try {
        String decrypted = await cryptor.decrypt(input.data, key);
        Person recievedContact = Person.fromJson(jsonDecode(decrypted));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PersonCheck(
                    personModel: recievedContact,
                  )),
        );
      } on MacMismatchException {
        Fluttertoast.showToast(
            msg: "Entschlüsselung Fehlgeschlagen. Passwort falsch!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0); // unable to decrypt (wrong key or forged data)
      }
  }
}
