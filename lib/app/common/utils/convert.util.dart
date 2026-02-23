class ConvertUtil {
   static bool toBool(dynamic value) {
    return value == "True" ||
        value == "TRUE" ||
        value == "true" ||
        value == "1" ||
        value == true ||
        value == 1;
  }
}