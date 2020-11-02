abstract class BaseStandardValidator {
  bool validateAgainstCountryTrackingStandard(Object scannedData) {
    // this method is the base method to define how the specific implementations. receiver their data.
    // All methods either return a true (the scanned information of the guest
    // satisfies the country health tracking requirement), oder false,
    // if the provided information is missing key information.
    return false;
  }
}
