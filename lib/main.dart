import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Device Info'),
        ),
        body: Center(
          child: DeviceInfoWidget(),
        ),
      ),
    );
  }
}

class DeviceInfoWidget extends StatefulWidget {
  @override
  _DeviceInfoWidgetState createState() => _DeviceInfoWidgetState();
}

class _DeviceInfoWidgetState extends State<DeviceInfoWidget> {
  static const platform = MethodChannel('com.example.device_info_channel');

  String deviceType = 'Unknown';
  String deviceModel = 'Unknown';
  String deviceBrand = 'Unknown';
  String osVersion = 'Unknown';
  String batteryLevel = 'Unknown';

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    try {
      final dynamic result = await platform.invokeMethod('getDeviceInfo');
      final Map<String, dynamic> deviceInfo = Map<String, dynamic>.from(result);
      setState(() {
        deviceType = deviceInfo['deviceType'] ?? 'Unknown';
        deviceModel = deviceInfo['deviceModel'] ?? 'Unknown';
        deviceBrand = deviceInfo['deviceBrand'] ?? 'Unknown';
        osVersion = deviceInfo['osVersion'] ?? 'Unknown';
        batteryLevel = deviceInfo['batteryLevel']?.toString() ?? 'Unknown'; // Convert to string
      });
    } on PlatformException catch (e) {
      print("Failed to get device info: '${e.message}'.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Sherzod Qulmurodov",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),),
        Text('Device Type: $deviceType'),
        Text('Device Model: $deviceModel'),
        Text('Device Brand: $deviceBrand'),
        Text('OS Version: $osVersion'),
        Text('Battery Level: $batteryLevel'),
      ],
    );
  }
}
