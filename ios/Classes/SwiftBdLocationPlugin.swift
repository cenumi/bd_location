import Flutter
import UIKit

public class SwiftBdLocationPlugin: NSObject, FlutterPlugin, BdLocationHostBridge,BMKLocationAuthDelegate,BMKLocationManagerDelegate {
    
    
    let locationManager = BMKLocationManager()
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftBdLocationPlugin()
        BdLocationHostBridgeSetup(registrar.messenger(), instance)
    }
    
    
    
    public func getLocationInfo(completion: @escaping (LocationInfo?, FlutterError?) -> Void) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation(withReGeocode: true, withNetworkState: true) { location , state, error in
            guard let error = error as NSError? else {
                let locationInfo = LocationInfo()
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
    
}
