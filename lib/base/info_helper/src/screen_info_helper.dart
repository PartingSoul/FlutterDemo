import 'package:flutter/material.dart';
import 'dart:ui';

/// 屏幕尺寸
final Size screenSize = MediaQueryData.fromWindow(window).size;
/// 屏幕宽
final double screenWidth = MediaQueryData.fromWindow(window).size.width;
/// 屏幕高
final double screenHeight = MediaQueryData.fromWindow(window).size.height;
/// 屏幕宽/375
final double screenWidthRatio = screenWidth/375;
/// 屏幕高/667
final double screenHeightRatio = screenHeight/667;
/// 状态栏高度 （iOS 全面屏为 44，其它为 20）
final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
/// 头部导航栏高度
final double topNavHeight = 44;
/// 状态栏高度+头部导航栏高度
final double topBarHeight = statusBarHeight + topNavHeight;
/// 底部高度 （iOS 全面屏为 34，其它为 0）
final double bottomHeight = MediaQueryData.fromWindow(window).padding.bottom;
/// 底部导航栏高度
final double bottomNavHeight = 49 + bottomHeight;
/// 是否为全面屏
final bool ifFullScreen = (statusBarHeight != 20);
/// 元素水平间距
const double elementHorizontal = 20;
/// 按钮高度
const double buttonHeight = 44;