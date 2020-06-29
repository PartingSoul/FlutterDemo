class ImagePath {
  static String wrap(String name, [String format = "png"]) {
    return "resource/image/$name.$format";
  }
}
