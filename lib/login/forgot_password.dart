import 'package:code/homeFront/themeBase/base_page.dart';
import 'package:code/login/login.dart';
import 'package:code/login/register.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginWidget()));
                            },
                            text: 'SING IN',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Align(
                  alignment: AlignmentDirectional(0, 0.15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.062,
                          decoration: BoxDecoration(
                            color: Color(0x00eeeeee),
                          ),
                          child: Text(
                            'Reset your password by sending an email to :',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: Color(0xFF101213),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.056,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x24000000),
                              )
                            ],
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: TextFormField(
                                    controller: textController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'textController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Entrer email here',
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
                                      fontSize: 13,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.062,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {},
                                  text: 'GO!',
                                  options: FFButtonOptions(
                                    width: MediaQuery.of(context).size.width *
                                        0.16,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
