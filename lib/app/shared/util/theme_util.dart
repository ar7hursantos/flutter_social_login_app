import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeUtil {
  /* COLORS */
  static Color primaryColor;

  /* DIMENSION */
  static bool isHighScreeDefinition;

  static void init(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design)
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context,
        width: 750.0, height: 1334.0, allowFontScaling: false);

    /* COLORS */
    primaryColor = Theme.of(context).primaryColor;

    /* DIMENSION */
    isHighScreeDefinition = ScreenUtil.screenHeight > 1334.0 ? true : false;
  }
}
