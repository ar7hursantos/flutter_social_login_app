import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../infrastructure/handlers/firebase/push_notification/notification_handler.dart';
import '../../../shared/util/theme_util.dart';
import 'splash_store.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

enum AuthStatusEnum {
  notDetermined,
  notLoggedIn,
  loggedIn,
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  AuthStatusEnum authStatus;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    authStatus = AuthStatusEnum.notDetermined;

    Future.delayed(Duration(seconds: 4)).then((v) {
      NotificationHandler().initializeFcmNotification();
    });

    Future.delayed(Duration(seconds: 3)).then((v) {
      if (authStatus == AuthStatusEnum.loggedIn) {
        Modular.to.pushNamedAndRemoveUntil('/home/', (_) => false);
        print('Logado!');
      } else {
        Modular.to.pushReplacementNamed('/authentication/login/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeUtil.init(context);

    return Scaffold(
      backgroundColor: ThemeUtil.primaryColor,
      key: _scaffoldKey,
      body: _buildSplashPageBody(),
    );
  }

  Widget _buildSplashPageBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Observer(builder: (_) {
          var isLogged = controller.userStore.isLogged();

          if (isLogged) {
            authStatus = AuthStatusEnum.loggedIn;
          } else {
            authStatus = AuthStatusEnum.notLoggedIn;
          }

          return Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Splash Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                  ),
                ),
                SizedBox(
                  height: 97.h,
                ),
                authStatus == AuthStatusEnum.notDetermined
                    ? _buildLoader()
                    : Container(),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildLoader() {
    return Container(
      height: 50.h,
      width: 50.h,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(ThemeUtil.primaryColor),
      ),
    );
  }
}
