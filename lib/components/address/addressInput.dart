import 'package:flutter/material.dart';
import 'package:manco_tracer/models/address.dart';

class AddressInput extends StatefulWidget {
  final Address addressmodel;
  final bool readonly;

  AddressInput({Key key, @required this.addressmodel, @required this.readonly})
      : super(key: key);

  @override
  _AddressInputState createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  TextEditingController streetController = TextEditingController();
  TextEditingController housenumberController = TextEditingController();
  TextEditingController localAreaCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  initState() {
    super.initState();
    streetController.text = widget.addressmodel.street;
    housenumberController.text = widget.addressmodel.houseNumber;
    localAreaCodeController.text = widget.addressmodel.localAreaCode;
    cityController.text = widget.addressmodel.city;
    countryController.text = widget.addressmodel.country;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Adresse:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      Row(
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  readOnly: widget.readonly,
                  controller: streetController,
                  onChanged: (value) {
                    widget.addressmodel.street = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Strasse',
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  readOnly: widget.readonly,
                  controller: housenumberController,
                  onChanged: (value) {
                    widget.addressmodel.houseNumber = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Hausnummer',
                  ),
                ),
              )),
        ],
      ),
      Row(
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  readOnly: widget.readonly,
                  controller: cityController,
                  onChanged: (value) {
                    widget.addressmodel.city = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Stadt',
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  readOnly: widget.readonly,
                  controller: localAreaCodeController,
                  onChanged: (value) {
                    widget.addressmodel.localAreaCode = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PLZ',
                  ),
                ),
              )),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          readOnly: widget.readonly,
          controller: countryController,
          onChanged: (value) {
            widget.addressmodel.country = value;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Land',
          ),
        ),
      ),
    ]);
  }
}
