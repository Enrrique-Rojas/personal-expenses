import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:personal_expenses/app/common/utils/convert.util.dart';

class Configuration {
static  const bool isDeveloper = true;

  static Future<void> load() async {
    await dotenv.load(fileName: Configuration.fileName);
  }

  static String get fileName {
    String environment = '.env';
    if(kDebugMode) {
      environment = isDeveloper ? '.env.dev' : '.env.qa';
    }
    return environment;
  }
  static String get host {
    return  dotenv.env['HOST'] ?? '';
  }

  static bool get isProd {
    return ConvertUtil.toBool(dotenv.env['ISPROD']); 
  }

  static String get instrumentationKey {
    return dotenv.env['INSTRUMENTATION_KEY'] ?? ''; 
  }
}
