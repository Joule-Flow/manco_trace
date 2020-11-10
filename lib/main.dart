import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manco_tracer/models/event.dart';
import 'package:manco_tracer/models/contact.dart';
import 'package:manco_tracer/screens/personData/export/personExporter.dart';

import 'package:path_provider/path_provider.dart';

import 'package:manco_tracer/screens/home.dart';
import 'package:manco_tracer/screens/readcontact/encrypted/qr_reader.dart';
import 'package:manco_tracer/screens/personData/edit/personedit.dart';
import 'package:manco_tracer/screens/event/manageEvent.dart';
import 'package:manco_tracer/screens/reporting/localHealthOrganizationApiEndpoint.dart';
import 'package:manco_tracer/components/bottomBar/privacyNotice/privacyNotice.dart';

import 'package:manco_tracer/models/address.dart';
import 'package:manco_tracer/models/person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeHiveBoxes();

  runApp(MaterialApp(
      title: 'ManCo Home Main', initialRoute: '/', routes: getRoutes()));
}

Future<bool> initializeHiveBoxes() async {
  final appDocDir = await getApplicationDocumentsDirectory();

  Hive
    ..initFlutter(appDocDir.path)
    ..registerAdapter(AddressAdapter())
    ..registerAdapter(PersonAdapter())
    ..registerAdapter(EventAdapter())
    ..registerAdapter(ContactAdapter());
  return true;
}

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => MainAppBody(),
    '/QRReader': (context) => QRReader(),
    '/ContactEdit': (context) => PersonEdit(),
    '/Report': (context) => LocalHealthOrganizationApiEndpoint(),
    '/privacyNotice': (context) => PrivacyNotice(),
    '/manageEvent': (context) => ManageEvent(),
    '/PersonExportQR': (context) => PersonExportQR()
  };
}
