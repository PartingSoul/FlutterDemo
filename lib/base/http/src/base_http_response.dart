import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String CodeKey = "state";
const String MsgKey = "message";
const String DataKey = "list";
class BaseHttpResponse {
  String requestUrl;
  int responseCode;
  String responseMsg;
  List responseData;
  Map responseJson;

  BaseHttpResponse(this.requestUrl, this.responseCode, { this.responseMsg, this.responseData , this.responseJson });

  @override
  String toString() {
    StringBuffer sb = StringBuffer('\n');
    sb.write('⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ Http response ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇');
    sb.write("\n");
    sb.write("requestUrl: $requestUrl\n");
    sb.write("responseCode: $responseCode\n");
    sb.write("responseMsg: $responseMsg\n");
    sb.write("responseData: $responseData\n");
    sb.write('⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆');
    return sb.toString();
  }
}

/// 返回结果处理
BaseHttpResponse httpResponseDispose(Response response) {
  BaseHttpResponse _httpResponse;
  if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
    try {
      Map<String, dynamic> _dataMap = _decodeData(response);
      _httpResponse ??= BaseHttpResponse(
          response.request.path,
        (_dataMap[CodeKey] is String) ? int.tryParse(_dataMap[CodeKey]) : _dataMap[CodeKey],
        responseMsg: _dataMap[MsgKey],
        responseData: _dataMap[DataKey],
        responseJson: _dataMap,
      );
    } catch (e) {
      _httpResponse ??= BaseHttpResponse(
        response.request.path,
        -1,
        responseMsg: e.toString(),
      );
    }
  }
  _httpResponse ??= BaseHttpResponse(
    response.request.path,
    -1,
    responseMsg: '未知错误',
  );
  _printResponse(_httpResponse);
  return _httpResponse;
}
/// 后台输出结果
void _printResponse(BaseHttpResponse response) {
  debugPrint(response.toString());
}
/// 解码成 Map
Map<String, dynamic> _decodeData(Response response) {
  if (response == null ||
      response.data == null ||
      response.data.toString().isEmpty) {
    return Map();
  }
  return json.decode(response.data.toString());
}