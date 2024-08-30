import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyDeviceUtils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isWeb() {
    return kIsWeb;
  }
}
