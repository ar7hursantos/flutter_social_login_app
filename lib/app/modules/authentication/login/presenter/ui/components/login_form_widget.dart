import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:validators/validators.dart';

import '../../../../../../shared/util/theme_util.dart';
import '../../stores/login_store.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key key}) : super(key: key);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  GlobalKey<FormState> _formKey;
  LoginStore loginStore;
  String email;
  String password;
  bool autoValidateForm = false;
  bool emailTextFormFieldAutoValidate = false;
  bool emailTextFormFieldIsValidated = false;
  bool passwordTextFormFieldAutoValidate = false;
  bool passwordTextFormFieldIsValidated = false;
  bool isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    isPasswordVisible = true;
    loginStore = Modular.get<LoginStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _keyboardDismisser(
        context: context,
        child: SingleChildScrollView(
          child: _buildForm(),
        ),
      ),
    );
  }

  bool _validateInputs() {
    final form = _formKey.currentState;
    FocusScope.of(context).requestFocus(FocusNode());

    if (form.validate()) {
      form.save();
      return true;
    } else {
      setState(() {
        autoValidateForm = true;
      });
      return false;
    }
  }

  Widget _keyboardDismisser({BuildContext context, Widget child}) {
    final gesture = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child,
    );
    return gesture;
  }

  Widget _buildForm() {
    final facebookButton = Container(
      margin: EdgeInsets.symmetric(horizontal: 28.w),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.0),
        ),
        color: Color(0xFF496CAD),
        padding: EdgeInsets.symmetric(vertical: 22.h),
        onPressed: loginStore.loginWithfacebook,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'CONECTAR COM O FACEBOOK  ',
              style: TextStyle(
                fontFamily: 'Ubuntu-Bold',
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset(
              'assets/images/login/facebook_icon.png',
              height: 45.w,
              width: 34.w,
            ),
          ],
        ),
      ),
    );

    final infoEmailText = Center(
      child: Text(
        'ou use o seu email',
        style: TextStyle(
          fontFamily: 'Ubuntu-Regular',
          color: Color(0xFF949494),
          fontSize: 29.sp,
        ),
      ),
    );

    final emailTextField = TextFormField(
      autovalidate: emailTextFormFieldAutoValidate,
      autocorrect: false,
      enableSuggestions: false,
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
      validator: (value) {
        if (value.length == 0) {
          return "Email não pode ser vazio";
        }
        if (!isEmail(value)) {
          return "Email inválido";
        } else {
          emailTextFormFieldIsValidated = true;
        }
        return null;
      },
      onChanged: (value) {
        email = value;
        if (value.contains('@') && value.contains('.')) {
          setState(() {
            emailTextFormFieldAutoValidate = true;
            if (isEmail(value)) {
              emailTextFormFieldIsValidated = true;
            } else {
              emailTextFormFieldIsValidated = false;
            }
          });
        } else {
          setState(() {
            emailTextFormFieldIsValidated = false;
          });
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontFamily: "Ubuntu_Regular",
      ),
    );

    final passwordTextField = TextFormField(
      autovalidate: passwordTextFormFieldAutoValidate,
      obscureText: isPasswordVisible,
      autocorrect: false,
      enableSuggestions: false,
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
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Senha não pode ser vazia";
        }
        if (val.length < 6) {
          return 'A senha é menor que 6 caracteres';
        } else {
          passwordTextFormFieldIsValidated = true;
        }
        return null;
      },
      onChanged: (value) {
        password = value;
        if (value.isNotEmpty && value.length >= 6) {
          setState(() {
            passwordTextFormFieldAutoValidate = true;
            passwordTextFormFieldIsValidated = true;
          });
        } else {
          setState(() {
            passwordTextFormFieldIsValidated = false;
          });
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontFamily: "Ubuntu_Regular",
      ),
    );

    final loginButton = Container(
      width: ScreenUtil.screenWidth,
      child: RoundedLoadingButton(
        color: ThemeUtil.primaryColor,
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontFamily: 'Ubuntu-Bold',
            color: Colors.white,
            fontSize: 42.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        controller: loginStore.btnLoginController,
        onPressed: (emailTextFormFieldIsValidated &&
                passwordTextFormFieldIsValidated)
            ? () async {
                var validateResult = _validateInputs();
                if (validateResult) {
                  await loginStore.loginWithEmailAndPassword(email, password);
                }
              }
            : null,
      ),
    );

    final criarContaText = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Não possui conta?',
          style: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            color: ThemeUtil.primaryColor,
            fontSize: 34.sp,
          ),
        ),
        GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/authentication/create_account');
          },
          child: Text(
            ' CRIAR UMA AGORA!',
            style: TextStyle(
              fontFamily: 'Ubuntu-Medium',
              color: ThemeUtil.primaryColor,
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );

    return Form(
      key: _formKey,
      autovalidate: autoValidateForm,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: 112.w,
                right: 112.w,
                top: ThemeUtil.isHighScreeDefinition ? 551.h : 515.h),
            child: Column(children: <Widget>[
              facebookButton,
              SizedBox(
                height: 18.h,
              ),
              infoEmailText,
              SizedBox(
                height: 20.h,
              ),
              emailTextField,
              SizedBox(
                height: 27.h,
              ),
              passwordTextField,
              SizedBox(
                height: 41.h,
              ),
              loginButton,
            ]),
          ),
          SizedBox(
            height: 44.h,
          ),
          Center(
            child: Column(children: <Widget>[
              criarContaText,
            ]),
          ),
        ],
      ),
    );
  }
}
