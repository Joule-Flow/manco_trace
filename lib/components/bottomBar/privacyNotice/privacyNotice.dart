import 'package:flutter/material.dart';

class PrivacyNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("PrivacyNotice")),
        body: Text("Placeholder for the privacy notice information."));
  }

  Widget getIcon() {
    return Icon(Icons.privacy_tip);
  }
}
