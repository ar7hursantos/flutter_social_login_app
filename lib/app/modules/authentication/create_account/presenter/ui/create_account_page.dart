import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/util/asuka_messages_util.dart';
import '../../../../../shared/util/theme_util.dart';
import '../states/create_account_state.dart';
import '../stores/create_account_store.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState
    extends ModularState<CreateAccountPage, CreateAccountStore> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers.add(
      reaction((_) => controller.state, (stateResult) {
        if (stateResult is CreateAccountLoadingState) {
          AsukaMessagesUtil.showLoading();
        } else {
          AsukaMessagesUtil.hideLoading(_scaffoldKey);
          if (stateResult is CreateAccountErrorState) {
            AsukaMessagesUtil.showDefaultSnackBar(stateResult.error.message);
          }
        }
      }),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    );
  }

  Widget _buildInfoEmailText() {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'INFORME',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Ubuntu_Bold',
              color: ThemeUtil.primaryColor,
              fontSize: 60.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'SEUS DADOS',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Ubuntu_Bold',
              color: ThemeUtil.primaryColor,
              fontSize: 60.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        labelText: "Email",
        labelStyle: TextStyle(
          fontFamily: 'Ubuntu_Regular',
          fontWeight: FontWeight.w300,
          fontSize: 27.sp,
          color: Color(0xFF949494),
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(45.w, 27.h, 20.w, 27.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Email cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontFamily: "Ubuntu_Regular",
      ),
    );
  }

  Widget _buildSenhaTextField() {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        labelText: "Senha",
        labelStyle: TextStyle(
          fontFamily: 'Ubuntu_Regular',
          fontWeight: FontWeight.w300,
          fontSize: 27.sp,
          color: Color(0xFF949494),
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(45.w, 27.h, 20.w, 27.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Senha cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontFamily: "Ubuntu_Regular",
      ),
    );
  }

  Widget _buildConfirmacaoSenhaTextField() {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        labelText: "Confirme sua senha",
        labelStyle: TextStyle(
          fontFamily: 'Ubuntu_Regular',
          fontWeight: FontWeight.w300,
          fontSize: 27.sp,
          color: Color(0xFF949494),
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(45.w, 27.h, 20.w, 27.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Senha cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontFamily: "Ubuntu_Regular",
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: ScreenUtil.screenWidth,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.0),
        ),
        color: ThemeUtil.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        onPressed: controller.createAccount,
        child: Text(
          'CADASTRAR',
          style: TextStyle(
            fontFamily: 'Ubuntu-Bold',
            color: Colors.white,
            fontSize: 42.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Center(
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: 112.w,
                  right: 112.w,
                  top: ThemeUtil.isHighScreeDefinition ? 430.h : 420.h),
              child: Column(children: <Widget>[
                _buildInfoEmailText(),
                SizedBox(
                  height: ThemeUtil.isHighScreeDefinition ? 50.h : 43.h,
                ),
                _buildEmailTextField(),
                SizedBox(
                  height: 27.h,
                ),
                _buildSenhaTextField(),
                SizedBox(
                  height: 27.h,
                ),
                _buildConfirmacaoSenhaTextField(),
                SizedBox(
                  height: ThemeUtil.isHighScreeDefinition ? 41.h : 33.h,
                ),
                _buildLoginButton(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    final greenHeadContainer = Container(
      color: ThemeUtil.primaryColor,
      width: ScreenUtil.screenWidth,
      height: 394.h,
    );

    return Stack(
      children: <Widget>[
        greenHeadContainer,
        _buildForm(),
      ],
    );
  }
}
