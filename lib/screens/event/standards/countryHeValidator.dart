import 'package:manco_tracer/screens/event/standards/baseStandardValidator.dart';

class CountryHeValidator extends BaseStandardValidator {
  bool validateAgainstCountryTrackingStandard(Object scannedData) {
    bool isValid =
        // (scannedData.firstName != null) &
        // (scannedData.firstName.length > 0) &
        // ... more comparisons of required fields of the scanned data.super
        // and finally if all comparison return a "true".
        // Every country could have its own validator ruleset for requirements.
        true;

    return isValid;
  }
}
