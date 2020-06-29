import 'dart:ui';

class ColorUtils {
  /// 解析RGB_888字符串颜色 例如#84838B ,A默认为FF
  ///
  /// color RGB_888 字符串颜色
  /// opacityRadio 不透明度
  static Color parse(String color, {double opacityRadio = 1}) {
    String string = color.replaceAll("#", "0x");
    int colorIntValue = int.parse(string);
    colorIntValue |= (0xFF * opacityRadio).toInt() << 24;
    return Color(colorIntValue);
  }
}
