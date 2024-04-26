import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show TargetPlatform, kIsWeb;
import 'package:permission_handler/permission_handler.dart';

class FileManagerService {
  static bool _hasWritePermission = false;

  static Future<void> init() async {
    _hasWritePermission = await requestWritePermission();
  }
  static Future<bool> requestWritePermission() async {
    try {
      late bool hasWritePermission;

      if (!kIsWeb) {
        if (Platform.isAndroid) {
          final storageStatus = await Permission.storage.request();
          hasWritePermission = storageStatus == PermissionStatus.granted;
        } else if (Platform.isIOS) {
          hasWritePermission = true;
        } else {
          hasWritePermission = true;
        }
      } else {
        hasWritePermission = true;
      }

      _hasWritePermission = hasWritePermission;
      return hasWritePermission;
    } catch (e) {
      print('Error requesting write permission: $e');
      return false;
    }
  }



  static bool get hasWritePermission => _hasWritePermission;
}

void main() async {
  FileManagerService.init();

  final hasWritePermission = await FileManagerService.requestWritePermission();

  print('Has write permission: $hasWritePermission');
}
