import 'package:flutter/material.dart';
import 'package:flutter_jianfeican/base/info_helper/info_helper.dart';

import './api.dart';

/************************ 图片 ID *************************/
/// 根据图片 ID 返回
///
/// placeholder 为本地空态图
/// size 为空返回原图
FadeInImage getFadeNetImageWithId(String imageId, {String format: 'jpg', Size size, String placeholder = ''}) {
  return FadeInImage.assetNetwork(
    placeholder: placeholder,
    image: getNetImagePath(imageId, format: format, size: size),
    fit: BoxFit.cover,
  );
}
/// 根据图片 ID 返回
///
/// emptyColor 为纯色
/// size 为空返回原图
Container getNetImageWithId(String imageId, {String format: 'jpg', Size size, Color emptyColor = emptyColor}) {
  return Container(
    decoration: BoxDecoration(
      color: emptyColor,
    ),
    child: Image.network(
      getNetImagePath(imageId, format: format, size: size),
      fit: BoxFit.cover,
    ),
  );
}
/// 根据图片 ID 拼接地址
String getNetImagePath(String imageId, {String format: 'jpg', Size size}) {
  /// 返回原图地址
  if (size == null)  return '$BaseImageUrl$imageId.$format';
  String _urlSuffix = '';
  double imgWidth = size.width*2;
  bool isSquare = size.width == size.height;
  /// 正方形
  if (isSquare) {
    if (imgWidth <= 80) {// 77x77
      _urlSuffix = '!s1';
    } else if (imgWidth <= 110) {// 100x100
      _urlSuffix = '!s2';
    } else if (imgWidth <= 144) {// 140x140
      _urlSuffix ='!s3';
    } else if (imgWidth <= 164) {// 156 x 156
      _urlSuffix = '!s5';
    } else if (imgWidth <= 200) {// 193x193
      _urlSuffix = '!s4';
    } else if (imgWidth <= 500) {// 450 x 450
      _urlSuffix = '!s6';
    } else {// 720 x720
      _urlSuffix = '!s7';
    }
  }
  /// 宽度固定，高度自适应
  else { /// 宽度固定，高度自适应
    if (imgWidth <= 180) { // 180
      _urlSuffix = '!m5';
    } else if (imgWidth <= 200) {// 200
      _urlSuffix = '!m6';
    } else if (imgWidth <= 230) {// 230
      _urlSuffix = '!m1';
    } else if (imgWidth <= 320) {// 300
      _urlSuffix = '!m4';
    } else if (imgWidth <= 400) {// 360
      _urlSuffix = '!m7';
    } else if (imgWidth <= 500){// 450
      _urlSuffix = '!m2';
    } else {// 750
      _urlSuffix = '!m3';
    }
  }
  return '$BaseImageUrl$imageId.$format$_urlSuffix';
}

/************************ 图片 url *************************/
/// 根据图片 url 返回
///
/// placeholder 为本地空态图
FadeInImage getFadeNetImageWithUrl(String url, {String placeholder = ''}) {
  return FadeInImage.assetNetwork(
    placeholder: placeholder,
    image: url,
    fit: BoxFit.cover,
  );
}
/// 根据图片 url 返回
///
/// emptyColor 为纯色
/// size 默认 Size.square(50)
Container getNetImageWithUrl(String url, {@required Size size, Color emptyColor = emptyColor}) {
  size ??= Size.square(50);
  return Container(
    decoration: BoxDecoration(
      color: emptyColor,
    ),
    child: Image.network(
      url,
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
    ),
  );
}

