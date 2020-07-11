import 'dart:io';

import 'package:dio/dio.dart';

import './base_http_pack.dart';
import './base_http_response.dart';

var httpRequest = HttpRequestHelper();

class HttpRequestHelper {
  /// 构造函数
  HttpRequestHelper._init() {
    _options = _getBaseOptions();
    _dio = Dio(_options);
  }
  /// 保存单例
  static HttpRequestHelper _instance;
  /// 工厂构造函数
  factory HttpRequestHelper() => _getInstance();

  static HttpRequestHelper _getInstance() {
    _instance ??= HttpRequestHelper._init();
    return _instance;
  }

  Dio _dio;
  BaseOptions _options;

  /// 初始化网络请求
  BaseOptions _getBaseOptions() {
    BaseOptions options = BaseOptions();
//    options.baseUrl = BaseHttpUrl;
//    options.queryParameters = ;
    options.sendTimeout = 1000 * 30;
    options.receiveTimeout = 1000 * 30;
    options.headers[HttpHeaders.authorizationHeader] = '';
    options.responseType = ResponseType.plain;
    return options;
  }
  /// Post
  Future<BaseHttpResponse> postRequest(String path, {data, CancelToken cancelToken, ProgressCallback onReceiveProgress}) async {
    return _request(
      path,
      data: data,
      options: Options(method: 'POST'),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
  /// Get
  Future<BaseHttpResponse> getRequest(String path, {data, CancelToken cancelToken, ProgressCallback onReceiveProgress}) async {
    return _request(
      path,
      data: data,
      options: Options(method: 'GET'),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
  /// 请求
  Future<BaseHttpResponse> _request(String path, {data, Options options, CancelToken cancelToken, ProgressCallback onReceiveProgress}) async {
    /// 包装
    Map<String, String> _params = await packHttpRequestParams(data);
    String _packPath = packHttpRequestURL(path);
    /// 正式请求
    Response response = await _dio.request(
      _packPath,
      queryParameters: _params,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      options: options,
    );
    /// 结果
    BaseHttpResponse _httpResponse = httpResponseDispose(response);
    return _httpResponse;
  }
}
