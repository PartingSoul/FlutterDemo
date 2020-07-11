/// 对象为空判断

bool emptyString(String str) {
  if (str == null) return true;
  if (str.length <= 0) return true;
  return false;
}

bool emptyList(List list) {
  if (list == null) return true;
  if (list.length <= 0) return true;
  return false;
}

void emptyFunction(Function fun) {
  if (fun == null) return;
  fun.call();
}