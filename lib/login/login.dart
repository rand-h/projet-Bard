import 'package:code/homeFront/themeBase/base_page.dart';
import 'package:code/login/forgot_password.dart';
import 'package:code/login/register.dart';
import 'package:code/login/flutter_flow/authentication.dart';

import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  String emailFieldMessage = "";
  String passwordFieldMessage = "";
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSigningIn = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFieldMessage = "pass";
    passwordFieldMessage = "pass";
    passwordVisibility = false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -0.75),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: MediaQuery.of(context).size.height * 0.125,
                  decoration: BoxDecoration(
                    color: Color(0x00eeeeee),
                  ),
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BasePage()));
                    },
                    child: Image.asset(
                      'assets/images/Bard-logo.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.35),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0xFF00AAEF),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('sign_in pressed ...');
                            },
                            text: 'SING IN',
                            options: FFButtonOptions(
                              color: Color(0xFF00AAEF),
                              textStyle: GoogleFonts.getFont(
                                'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.375,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterWidget()));
                            },
                            text: 'SIGN UP',
                            options: FFButtonOptions(
                              color: Colors.white,
                              textStyle: GoogleFonts.getFont(
                                'Poppins',
                                color: Color(0xFF00AAEF),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.04),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.064,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Color(0x25000000),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/email.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                              child: TextFormField(
                                controller: emailController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  emailFieldMessage,
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Color(0xFF101213),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.064,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                        border: Border.all(
                          color: Color(0x25000000),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/key.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: TextFormField(
                                controller: passwordController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  passwordFieldMessage,
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Color(0xFF101213),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.65),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: emailController!.text,
                                            password: passwordController!.text);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => BasePage()));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');
                                      emailFieldMessage =
                                          'No user found for that email.';
                                    } else if (e.code == 'wrong-password') {
                                      print(
                                          'Wrong password provided for that user.');
                                      passwordFieldMessage = 'Wrong password';
                                    }
                                  }
                                },
                                text: 'GO!',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.of(context).size.width * 0.16,
                                  height: MediaQuery.of(context).size.height *
                                      0.064,
                                  color: Color(0xFF00AAEF),
                                  textStyle: GoogleFonts.getFont(
                                    'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  elevation: 10,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Image.asset(
                                  'assets/images/right-arrow.png',
                                  width: 50,
                                  height: MediaQuery.of(context).size.height *
                                      0.042,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 20),
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color(0x00eeeeee),
                            ),
                            child: InkWell(
                              onTap: () async => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordWidget()))
                              },
                              child: Text(
                                'Forgot password!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Color(0xFF101213),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                _isSigningIn = true;
                              });

                              User? user =
                                  await Authentication.signInWithGoogle(
                                      context: context);

                              setState(() {
                                _isSigningIn = false;
                              });

                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => BasePage(
                                        //user: user,
                                        ),
                                  ),
                                );
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/images/google.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 15, 0),
                                  child: Text(
                                    'Login with Google',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      color: Color(0xFF101213),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
