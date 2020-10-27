// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../../shared/util/theme_util.dart';
// import '../../stores/create_account_store.dart';

// class CreateAccountFormWidget extends StatefulWidget {
//   const CreateAccountFormWidget({Key key}) : super(key: key);

//   @override
//   _CreateAccountFormWidgetState createState() =>
//       _CreateAccountFormWidgetState();
// }

// class _CreateAccountFormWidgetState extends State<CreateAccountFormWidget> {
//   CreateAccountStore createAccountStore;

//   @override
//   void initState() {
//     super.initState();
//     createAccountStore = Modular.get<CreateAccountStore>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Form(
//         child: Column(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(
//                   left: 112.w,
//                   right: 112.w,
//                   top: ThemeUtil.isHighScreeDefinition ? 430.h : 420.h),
//               child: Column(children: <Widget>[
//                 _buildInfoEmailText(),
//                 SizedBox(
//                   height: ThemeUtil.isHighScreeDefinition ? 50.h : 43.h,
//                 ),
//                 _buildEmailTextField(),
//                 SizedBox(
//                   height: 27.h,
//                 ),
//                 _buildSenhaTextField(),
//                 SizedBox(
//                   height: 27.h,
//                 ),
//                 _buildConfirmacaoSenhaTextField(),
//                 SizedBox(
//                   height: ThemeUtil.isHighScreeDefinition ? 41.h : 33.h,
//                 ),
//                 _buildLoginButton(),
//               ]),
//             ),
//             SizedBox(
//               height: 44.h,
//             ),
//             Center(
//               child: Column(children: <Widget>[
//                 _buildCriarContaText(),
//                 SizedBox(
//                   height: ThemeUtil.isHighScreeDefinition ? 100.h : 50.h,
//                 ),
//                 greenLogoBottomImage,
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoEmailText() {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Text(
//             'INFORME',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Ubuntu_Bold',
//               color: ThemeUtil.primaryColor,
//               fontSize: 60.sp,
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           Text(
//             'SEUS DADOS',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Ubuntu_Bold',
//               color: ThemeUtil.primaryColor,
//               fontSize: 60.sp,
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmailTextField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         isDense: true,
//         labelText: "Email",
//         labelStyle: TextStyle(
//           fontFamily: 'Ubuntu_Regular',
//           fontWeight: FontWeight.w300,
//           fontSize: 27.sp,
//           color: Color(0xFF949494),
//         ),
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.fromLTRB(45.w, 27.h, 20.w, 27.h),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25.0),
//           borderSide: BorderSide(),
//         ),
//       ),
//       validator: (val) {
//         if (val.length == 0) {
//           return "Email cannot be empty";
//         } else {
//           return null;
//         }
//       },
//       keyboardType: TextInputType.emailAddress,
//       style: TextStyle(
//         fontFamily: "Ubuntu_Regular",
//       ),
//     );
//   }

//   Widget _buildSenhaTextField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         isDense: true,
//         labelText: "Senha",
//         labelStyle: TextStyle(
//           fontFamily: 'Ubuntu_Regular',
//           fontWeight: FontWeight.w300,
//           fontSize: 27.sp,
//           color: Color(0xFF949494),
//         ),
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.fromLTRB(45.w, 27.h, 20.w, 27.h),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25.0),
//           borderSide: BorderSide(),
//         ),
//         //fillColor: Colors.green
//       ),
//       validator: (val) {
//         if (val.length == 0) {
//           return "Senha cannot be empty";
//         } else {
//           return null;
//         }
//       },
//       keyboardType: TextInputType.emailAddress,
//       style: TextStyle(
//         fontFamily: "Ubuntu_Regular",
//       ),
//     );
//   }

//   Widget _buildConfirmacaoSenhaTextField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         isDense: true,
//         labelText: "Confirme sua senha",
//         labelStyle: TextStyle(
//           fontFamily: 'Ubuntu_Regular',
//           fontWeight: FontWeight.w300,
//           fontSize: 27.sp,
//           color: Color(0xFF949494),
//         ),
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.fromLTRB(45.w, 27.h, 20.w, 27.h),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25.0),
//           borderSide: BorderSide(),
//         ),
//       ),
//       validator: (val) {
//         if (val.length == 0) {
//           return "Senha cannot be empty";
//         } else {
//           return null;
//         }
//       },
//       keyboardType: TextInputType.emailAddress,
//       style: TextStyle(
//         fontFamily: "Ubuntu_Regular",
//       ),
//     );
//   }

//   Widget _buildLoginButton() {
//     return Container(
//       width: ScreenUtil.screenWidth,
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(45.0),
//         ),
//         color: ThemeUtil.primaryColor,
//         padding: EdgeInsets.symmetric(vertical: 18.h),
//         onPressed: createAccountStore.createAccount,
//         child: Text(
//           'CADASTRAR',
//           style: TextStyle(
//             fontFamily: 'Ubuntu-Bold',
//             color: Colors.white,
//             fontSize: 42.sp,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCriarContaText() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           'Ao cadastrar-se você concorda com os',
//           style: TextStyle(
//             fontFamily: 'Ubuntu-Regular',
//             color: Color(0xFF707070),
//             fontSize: 29.sp,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Termos de Serviço',
//               style: TextStyle(
//                 fontFamily: 'Ubuntu-Medium',
//                 color: Color(0xFF00CE30),
//                 fontSize: 28.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Text(
//               ' e a ',
//               style: TextStyle(
//                 fontFamily: 'Ubuntu-Regular',
//                 color: Color(0xFF949494),
//                 fontSize: 28.sp,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             Text(
//               'Política de Privacidade',
//               style: TextStyle(
//                 fontFamily: 'Ubuntu-Medium',
//                 color: Color(0xFF00CE30),
//                 fontSize: 28.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   final Widget greenLogoBottomImage = Image(
//     height: 50.h,
//     image: AssetImage('assets/images/logo_verde.png'),
//   );
// }
