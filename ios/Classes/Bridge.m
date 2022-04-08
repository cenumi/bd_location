// Autogenerated from Pigeon (v2.0.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Bridge.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface LocationInfo ()
+ (LocationInfo *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation LocationInfo
+ (instancetype)makeWithProvince:(nullable NSString *)province
    city:(nullable NSString *)city
    distinct:(nullable NSString *)distinct
    adCode:(nullable NSString *)adCode {
  LocationInfo* pigeonResult = [[LocationInfo alloc] init];
  pigeonResult.province = province;
  pigeonResult.city = city;
  pigeonResult.distinct = distinct;
  pigeonResult.adCode = adCode;
  return pigeonResult;
}
+ (LocationInfo *)fromMap:(NSDictionary *)dict {
  LocationInfo *pigeonResult = [[LocationInfo alloc] init];
  pigeonResult.province = GetNullableObject(dict, @"province");
  pigeonResult.city = GetNullableObject(dict, @"city");
  pigeonResult.distinct = GetNullableObject(dict, @"distinct");
  pigeonResult.adCode = GetNullableObject(dict, @"adCode");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.province ? self.province : [NSNull null]), @"province", (self.city ? self.city : [NSNull null]), @"city", (self.distinct ? self.distinct : [NSNull null]), @"distinct", (self.adCode ? self.adCode : [NSNull null]), @"adCode", nil];
}
@end

@interface BdLocationHostBridgeCodecReader : FlutterStandardReader
@end
@implementation BdLocationHostBridgeCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [LocationInfo fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface BdLocationHostBridgeCodecWriter : FlutterStandardWriter
@end
@implementation BdLocationHostBridgeCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[LocationInfo class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface BdLocationHostBridgeCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation BdLocationHostBridgeCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[BdLocationHostBridgeCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[BdLocationHostBridgeCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *BdLocationHostBridgeGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    BdLocationHostBridgeCodecReaderWriter *readerWriter = [[BdLocationHostBridgeCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void BdLocationHostBridgeSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<BdLocationHostBridge> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.BdLocationHostBridge.getLocationInfo"
        binaryMessenger:binaryMessenger
        codec:BdLocationHostBridgeGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getLocationInfoWithCompletion:)], @"BdLocationHostBridge api (%@) doesn't respond to @selector(getLocationInfoWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api getLocationInfoWithCompletion:^(LocationInfo *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.BdLocationHostBridge.setIOSKey"
        binaryMessenger:binaryMessenger
        codec:BdLocationHostBridgeGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setIOSKeyKey:error:)], @"BdLocationHostBridge api (%@) doesn't respond to @selector(setIOSKeyKey:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_key = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setIOSKeyKey:arg_key error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.BdLocationHostBridge.agreePrivacyAgreement"
        binaryMessenger:binaryMessenger
        codec:BdLocationHostBridgeGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(agreePrivacyAgreementAgree:error:)], @"BdLocationHostBridge api (%@) doesn't respond to @selector(agreePrivacyAgreementAgree:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_agree = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api agreePrivacyAgreementAgree:arg_agree error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
