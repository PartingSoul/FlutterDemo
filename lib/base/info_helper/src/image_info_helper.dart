import 'package:flutter/material.dart';

String getCommonImagePath(String name, {String format: 'png'}) {
  return 'assets/common/$name.$format';
}
Image getCommonImage(String name, {String format: 'png'}) {
  return Image.asset(getCommonImagePath(name, format:format));
}
/// assets/home/
String getHomeImagePath(String name, {String format: 'png'}) {
  return 'assets/home/$name.$format';
}
Image getHomeImage(String name, {String format: 'png'}) {
  return Image.asset(getHomeImagePath(name, format:format));
}
/// assets/menu/
String getMenuDetailImagePath(String name, {String format: 'png'}) {
  return 'assets/menu/$name.$format';
}
Image getMenuDetailImage(String name, {String format: 'png'}) {
  return Image.asset(getMenuDetailImagePath(name, format:format));
}
/// assets/tab/
String getTabImagePath(String name, {String format: 'png'}) {
  return 'assets/tab/$name.$format';
}
Image getTabImage(String name, {String format: 'png'}) {
  return Image.asset(getTabImagePath(name, format:format));
}