import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manco_tracer/services/storage/settingsStorage.dart';

class LocalHealthOrganizationApiEndpoint extends StatefulWidget {
  @override
  _LocalHealthOrganizationApiEndpointState createState() =>
      _LocalHealthOrganizationApiEndpointState();
}

class _LocalHealthOrganizationApiEndpointState
    extends State<LocalHealthOrganizationApiEndpoint> {
  final TextEditingController _controller = TextEditingController();
  bool _init = false;
  SettingsStorage settings;

  initStorage() async {
    this.settings = SettingsStorage();
    _controller.text = await settings.getLocalHealthOrgEndpointURL();
    setState(() {
      this._init = true;
    });
  }

  @override
  initState() {
    super.initState();
    initStorage();
  }

  @override
  void dispose() {
    super.dispose();
    this.settings?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this._init) {
      return Scaffold(
          appBar: AppBar(
            title: Text("localHealthOrganizationApi"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                TextField(
                  controller: _controller,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'url',
                  ),
                ),
                Text("Here you could send data to your local health org"),
                ElevatedButton(
                  onPressed: () {
                    this
                        .settings
                        .setLocalHealthOrgEndpointURL(_controller.text);
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ])));
    } else {
      return CircularProgressIndicator();
    }
  }
}
