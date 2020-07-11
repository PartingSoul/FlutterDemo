import 'dart:io';

import 'package:device_info/device_info.dart';



class BDeviceInfo {
  static BDeviceInfo _instance;

  BDeviceInfo({this.deviceInfo, this.iosInfo, this.androidInfo});

  final DeviceInfoPlugin deviceInfo;
  final IosDeviceInfo iosInfo;
  final AndroidDeviceInfo androidInfo;

  static Future<BDeviceInfo> _getDeviceInfo() async {
    if(_instance != null) return _instance;
    DeviceInfoPlugin device = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo ios = await device.iosInfo;
      _instance = BDeviceInfo(deviceInfo: device, iosInfo: ios);
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo android = await device.androidInfo;
      _instance = BDeviceInfo(deviceInfo: device, androidInfo: android);
    } else {
      _instance = BDeviceInfo(deviceInfo: device);
    }
    return _instance;
  }

  static Future<String> getDeviceID() async {
    _instance = await _getDeviceInfo();
    if (Platform.isIOS && _instance.iosInfo != null) {
      return _instance.iosInfo.identifierForVendor; // 574FEF3B-95C5-4B42-8414-B36E9DF0B799
    } else if (Platform.isAndroid && _instance.androidInfo != null) {
      return _instance.androidInfo.id;
    }
    return '';
  }

  static Future<String> getSystemPlatform() async {
    _instance = await _getDeviceInfo();
    if (Platform.isIOS && _instance.iosInfo != null) {
      return _instance.iosInfo.systemName; // iOS
    } else if (Platform.isAndroid && _instance.androidInfo != null) {
      return "android";
    }
    return '';
  }

  static Future<String> getDeviceName() async {
    _instance = await _getDeviceInfo();
    if (Platform.isIOS && _instance.iosInfo != null) {
      return _instance.iosInfo.name; // iPhone 11 Pro
    } else if (Platform.isAndroid && _instance.androidInfo != null) {
      return _instance.androidInfo.brand;
    }
    return '';
  }

  static Future<String> getSystemVersion() async {
    _instance = await _getDeviceInfo();
    if (Platform.isIOS && _instance.iosInfo != null) {
      return _instance.iosInfo.systemVersion; // 13.4.1
    } else if (Platform.isAndroid && _instance.androidInfo != null) {
      return _instance.androidInfo.version.sdkInt.toString();
    }
    return '';
  }

  static Future<bool> ifIPad() async {
    _instance = await _getDeviceInfo();
    if (Platform.isIOS && _instance.iosInfo != null) {
      return _instance.iosInfo.model.contains('IPad');
    }
    return false;
  }
}