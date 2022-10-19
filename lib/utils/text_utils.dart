
class TextUtils {
  static bool parseBool(dynamic text) {
    if (text.toString().compareTo("1") == 0 ||
        text.toString().compareTo("true") == 0) {
      return true;
    }
    return false;
  }

  static String boolToString(bool boolean) {
    return boolean ? "1" : "0";
  }

  static String doubleToString(double value) {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
  }
}
