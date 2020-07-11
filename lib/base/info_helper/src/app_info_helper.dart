import 'package:package_info/package_info.dart';

class BAppInfo {
  BAppInfo({this.packageInfo});
  static BAppInfo _instance;
  static Future<BAppInfo> _getPackageInfo() async {
    if(_instance != null) return _instance;
    PackageInfo info = await PackageInfo.fromPlatform();
    _instance = BAppInfo(
      packageInfo: info,
    );
    return _instance;
  }
  final PackageInfo packageInfo;

  /// APP名称
  static Future<String> getAppName() async {
    _instance = await _getPackageInfo();
    return _instance.packageInfo.appName;
  }
   /// 包名
  static Future<String> getPackageName() async {
    _instance = await _getPackageInfo();
    return _instance.packageInfo.packageName;
  }
  /// 版本号
  static Future<String> getVersion() async {
    _instance = await _getPackageInfo();
    return _instance.packageInfo.version;
  }
  /// 版本构建号
  static Future<String> getBuildNumber() async {
    _instance = await _getPackageInfo();
    return _instance.packageInfo.buildNumber;
  }
}