import 'dart:io';

class InternetUtil {
  static Future<bool> internetIsActive() async {
    try {
      final result = await InternetAddress.lookup("www.google.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (ex) {
      return false;
    }
  }
}
