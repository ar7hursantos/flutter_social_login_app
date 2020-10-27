import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_dialog/material_dialog.dart';

import '../../shared/components/asuka_singleton.dart' as asuka;
import '../../shared/util/theme_util.dart';

class AsukaMessagesUtil {
  static void showLoading() {
    asuka.showDialog(
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
          backgroundColor: Colors.black54,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.white.withAlpha(100),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ThemeUtil.primaryColor),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Aguarde....",
                    style: TextStyle(
                        color: ThemeUtil.primaryColor, fontSize: 27.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static void hideLoading(GlobalKey<ScaffoldState> key) {
    Navigator.of(key.currentContext, rootNavigator: true).pop();
  }

  static void showError(String message) {
    asuka.showDialog(
        builder: (context) => Flushbar(
              title: "Hey Ninja",
              message: message,
              backgroundColor: Colors.red,
              boxShadows: [
                BoxShadow(
                  color: Colors.red[800],
                  offset: Offset(0.0, 2.0),
                  blurRadius: 3.0,
                )
              ],
            )..show(context));
  }

  static void showDefaultSnackBar(String text) {
    asuka.showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: Colors.grey,
      content: Text(text,
          style: TextStyle(
            fontSize: 30.sp,
            color: Colors.white,
          )),
    ));
  }

  static void showBottomSheet() {
    asuka.showBottomSheet((context) => Container());
  }

  static void showMaterialDialog(String alertTitle, String alertText,
      {String subtitle, bool showConfirmationButton = true}) {
    asuka.showDialog(
      builder: (context) => MaterialDialog(
        borderRadius: 8.0,
        enableFullHeight: true,
        enableFullWidth: true,
        enableCloseButton: true,
        closeButtonColor: Colors.white,
        headerColor: Theme.of(context).primaryColor,
        title: Text(
          alertTitle ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35.sp,
          ),
        ),
        subTitle: subtitle != null
            ? Text(
                subtitle ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                ),
              )
            : null,
        onCloseButtonClicked: () {
          Navigator.pop(context);
        },
        children: <Widget>[
          Text(
            alertText ?? '',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 28.sp,
            ),
          ),
        ],
        actions: <Widget>[
          showConfirmationButton
              ? FlatButton(
                  child: Text(
                    'OK',
                    style: Theme.of(context).textTheme.button.copyWith(
                        fontSize: 30.sp,
                        color: ThemeUtil.primaryColor,
                        fontFamily: 'Ubuntu_Regular'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : null,
        ],
      ),
    );
  }
}
