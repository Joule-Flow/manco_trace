import 'package:flutter/material.dart';
import 'package:manco_tracer/components/address/addressInput.dart';
import 'package:manco_tracer/models/person.dart';
import 'package:intl/intl.dart';

enum _Validator { address, firstname, lastname, birthday }

class ContactInfo extends StatefulWidget {
  final bool readonly;
  final Person contactmodel;

  ContactInfo({Key key, @required this.contactmodel, @required this.readonly})
      : super(key: key);

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  @override
  initState() {
    super.initState();
    firstnameController.text = widget.contactmodel.firstName;
    lastnameController.text = widget.contactmodel.lastName;
    birthdayController.text = DateFormat("dd.MM.yyyy")
        .format(widget.contactmodel.birthday ?? DateTime.now());
  }

  void dispose() {
    super.dispose();
  }

  bool isReadonly(_Validator infoType) {
    //! implement some validator checks
    return widget.readonly;
  }

  Future<void> _selectDate(BuildContext context) async {
    if (isReadonly(_Validator.birthday)) {
      return null;
    }

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1910),
        lastDate: DateTime.now());
    if (picked != null &&
        picked != widget.contactmodel.birthday &&
        widget.readonly == false)
      setState(() {
        widget.contactmodel.birthday = picked;
        birthdayController.text = DateFormat("dd.MM.yyyy").format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Persönliche Daten:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          readOnly: isReadonly(_Validator.firstname),
          controller: firstnameController,
          onChanged: (value) {
            widget.contactmodel.firstName = value;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Vorname',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          readOnly: isReadonly(_Validator.lastname),
          controller: lastnameController,
          onChanged: (value) {
            widget.contactmodel.lastName = value;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nachname',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          readOnly: true,
          onTap: () => {_selectDate(context)},
          controller: birthdayController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Geburtstag',
          ),
        ),
      ),
      AddressInput(
          addressmodel: widget.contactmodel.address,
          readonly: isReadonly(_Validator.address)),
    ]);
  }
}
