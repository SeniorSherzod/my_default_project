package com.example.my_default_project

import android.os.BatteryManager
import android.os.Build
import android.telephony.TelephonyManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val DEVICE_INFO_CHANNEL = "com.example.device_info_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DEVICE_INFO_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceInfo") {
                val deviceInfo = getDeviceInfo()
                result.success(deviceInfo)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceInfo(): Map<String, Any?> {
        val deviceType = getDeviceType()
        val deviceModel = Build.MODEL
        val deviceBrand = Build.BRAND
        val osVersion = Build.VERSION.RELEASE
        val batteryLevel = getBatteryLevel()

        return mapOf(
            "deviceType" to deviceType,
            "deviceModel" to deviceModel,
            "deviceBrand" to deviceBrand,
            "osVersion" to osVersion,
            "batteryLevel" to batteryLevel
        )
    }

    private fun getDeviceType(): String {
        val telephonyManager = getSystemService(TELEPHONY_SERVICE) as TelephonyManager
        return if (telephonyManager.phoneType != TelephonyManager.PHONE_TYPE_NONE) {
            "Phone"
        } else {
            "Tablet"
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }
}
