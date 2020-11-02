import 'dart:async';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<String> reportToLocalHealthOrganizationApi() async {
  final String reportingData = "reportingData";
  await Hive.openBox(reportingData);
  final Map listToBeReported = Hive.box(reportingData).toMap();
  String healthOrganizationApiEndPoint =
      "https://www.gesundheitsamt.landkreis-fulda.de/api/v1.0/";

  http.Response response = await http.post(
    healthOrganizationApiEndPoint,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'reportingList': listToBeReported.toString(),
    }),
  );

  if (response.statusCode == 200) {
    Hive.box(reportingData).clear();

    return "data has been reported to local health organization.";
  } else {
    throw Exception('Failed to report to local health organization.');
  }
}
