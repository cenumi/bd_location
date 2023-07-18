package com.c1yde3.bd_location

import android.content.Context
import androidx.annotation.NonNull
import com.baidu.location.BDAbstractLocationListener
import com.baidu.location.BDLocation
import com.baidu.location.LocationClient
import com.baidu.location.LocationClientOption

import io.flutter.embedding.engine.plugins.FlutterPlugin
import com.c1yde3.bd_location.Brigde.*
import java.net.URL
import java.util.*
import javax.net.ssl.HttpsURLConnection
import javax.net.ssl.KeyManager
import javax.net.ssl.SSLSocketFactory

/** BdLocationPlugin */
class BdLocationPlugin : FlutterPlugin, BdLocationHostBridge {


    private lateinit var applicationContext: Context
    private var locationClient: LocationClient? = null
    private var locationListener: BDAbstractLocationListener? = null


    private val locationOption = LocationClientOption().apply {
        setIsNeedAddress(true)
    }


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = flutterPluginBinding.applicationContext
        BdLocationHostBridge.setup(flutterPluginBinding.binaryMessenger, this)
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        locationListener = null
        BdLocationHostBridge.setup(binding.binaryMessenger, null)
    }

    override fun getLocationInfo(result: Result<LocationInfo>) {
        locationListener = object : BDAbstractLocationListener() {
            override fun onReceiveLocation(location: BDLocation?) {
                if (location != null) {
                    locationClient?.stop()
                    locationClient?.unRegisterLocationListener(this)
                    locationListener = null
                    result.success(LocationInfo().apply {
                        province = location.province
                        city = location.city
                        distinct = location.district
                        adCode = location.adCode
                    })
                }
            }
        }
        locationClient?.registerLocationListener(locationListener)
        locationClient?.start()

    }

    override fun setIOSKey(key: String) {
        // Do Nothing
    }

    override fun agreePrivacyAgreement(agree: Boolean) {
        LocationClient.setAgreePrivacy(agree)
        locationClient = LocationClient(applicationContext)
        locationClient?.locOption = locationOption
    }

}
