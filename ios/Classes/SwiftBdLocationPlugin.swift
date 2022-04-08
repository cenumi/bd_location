import Flutter
import UIKit

@available(iOS 13.0.0, *)
public class SwiftBdLocationPlugin: NSObject, FlutterPlugin, BdLocationHostBridge,BMKLocationAuthDelegate,BMKLocationManagerDelegate {
  
    

    var locationManager:BMKLocationManager? = nil
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftBdLocationPlugin()
        BdLocationHostBridgeSetup(registrar.messenger(), instance)
    }
    
    
    
    public func getLocationInfo(completion: @escaping (LocationInfo?, FlutterError?) -> Void) {
        let locationInfo = LocationInfo()
        
        guard let locationManager = locationManager else {
            completion(locationInfo,nil)
            return
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation(withReGeocode: true, withNetworkState: true) { location , state, error in
            guard let error = error as NSError? else {
               
                locationInfo.province = location?.rgcData?.province
                locationInfo.city = location?.rgcData?.city
                locationInfo.distinct = location?.rgcData?.district
                locationInfo.adCode = location?.rgcData?.adCode

                completion(locationInfo, nil)
                return
            }
            completion(nil, FlutterError(code: error.code.description, message: error.localizedDescription, details: nil))
        }
    }

    public func setIOSKeyKey(_ key: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        BMKLocationAuth.sharedInstance().checkPermision(withKey: key, authDelegate: self)
    }
    
    public func agreePrivacyAgreementAgree(_ agree: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        BMKLocationAuth.sharedInstance().setAgreePrivacy(agree.boolValue)
        locationManager = BMKLocationManager()
    }
    
    
}
