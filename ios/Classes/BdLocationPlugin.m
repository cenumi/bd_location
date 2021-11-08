#import "BdLocationPlugin.h"
#if __has_include(<bd_location/bd_location-Swift.h>)
#import <bd_location/bd_location-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bd_location-Swift.h"
#endif

@implementation BdLocationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBdLocationPlugin registerWithRegistrar:registrar];
}
@end
