mkdir ../lib/src
flutter pub run pigeon \
  --input pigeon/bridge.dart \
  --dart_out lib/src/bridge.dart \
  --objc_header_out ios/Classes/Bridge.h \
  --objc_source_out ios/Classes/Bridge.m \
  --java_out android/src/main/kotlin/com/c1yde3/bd_location/Brigde.java \
  --java_package "com.c1yde3.bd_location"