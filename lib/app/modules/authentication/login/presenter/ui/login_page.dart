import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/util/theme_util.dart';
import '../stores/login_store.dart';
import 'components/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            _buildLoginPageBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginPageBody() {
    final greenHeadContainer = Container(
      color: ThemeUtil.primaryColor,
      width: ScreenUtil.screenWidth,
      height: 296.h,
    );

    return Stack(
      children: <Widget>[
        greenHeadContainer,
        LoginFormWidget(),
      ],
    );
  }
}
