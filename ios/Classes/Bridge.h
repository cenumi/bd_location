// Autogenerated from Pigeon (v2.0.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class LocationInfo;

@interface LocationInfo : NSObject
+ (instancetype)makeWithProvince:(nullable NSString *)province
    city:(nullable NSString *)city
    distinct:(nullable NSString *)distinct
    adCode:(nullable NSString *)adCode;
@property(nonatomic, copy, nullable) NSString * province;
@property(nonatomic, copy, nullable) NSString * city;
@property(nonatomic, copy, nullable) NSString * distinct;
@property(nonatomic, copy, nullable) NSString * adCode;
@end

/// The codec used by BdLocationHostBridge.
NSObject<FlutterMessageCodec> *BdLocationHostBridgeGetCodec(void);

@protocol BdLocationHostBridge
- (void)getLocationInfoWithCompletion:(void(^)(LocationInfo *_Nullable, FlutterError *_Nullable))completion;
- (void)setIOSKeyKey:(NSString *)key error:(FlutterError *_Nullable *_Nonnull)error;
- (void)agreePrivacyAgreementAgree:(NSNumber *)agree error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void BdLocationHostBridgeSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<BdLocationHostBridge> *_Nullable api);

NS_ASSUME_NONNULL_END
