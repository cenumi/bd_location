import 'package:pigeon/pigeon.dart';

class LocationInfo {
  String? province;
  String? city;
  String? distinct;
  String? adCode;
}

@HostApi()
abstract class BdLocationHostBridge {
  @async
  LocationInfo getLocationInfo();

  void setIOSKey(String key);

  void agreePrivacyAgreement(bool agree);
}
