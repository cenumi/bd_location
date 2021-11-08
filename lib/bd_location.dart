import 'package:bd_location/src/bridge.dart';

export 'src/bridge.dart' show LocationInfo;

class BdLocation {
  BdLocation._();

  static final instance = BdLocation._();

  factory BdLocation() => instance;

  final bridge = BdLocationHostBridge();

  Future<LocationInfo> get locationInfo => bridge.getLocationInfo();

  Future<void> setIOSKey(String key) => bridge.setIOSKey(key);
}
