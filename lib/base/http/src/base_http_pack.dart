import 'package:flutter_jianfeican/base/info_helper/info_helper.dart';

import './api.dart';

/// 包装 http
String packHttpRequestURL(String url) {
  if (!url.contains('http')) {
    return '$BaseHttpUrl$url';
  }
  return url;
}
/// 包装头参数
Map<String, String> _publicParamsMap;
Future<Map<String, String>> packHttpRequestParams(data) async {
  if (_publicParamsMap == null) {
    String deviceID = await BDeviceInfo.getDeviceID();
    String sys = await BDeviceInfo.getSystemPlatform();
    String device = await BDeviceInfo.getDeviceName();
    String appVersion = await BAppInfo.getVersion();
    String sysVersion = await BDeviceInfo.getSystemVersion();
    _publicParamsMap = {
      'dn': deviceID,
      'sys': sys,
      'device': device,
      'version': "13.5",
      'sys_version': sysVersion,
    };
  }
  if(data == null) return _publicParamsMap;
  data.addAll(_publicParamsMap);
  return data;
}
