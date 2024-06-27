import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_shop/screen/Account/recovery_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/Account/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/config/responsive/responsive_widget.dart';
import 'package:pet_shop/config/validators/validation.dart';

import 'package:http/http.dart' as http;

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  _OtpVerifyScreenState createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  TextEditingController textEditingController =
      new TextEditingController(text: "");
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // Verification
  String _otpCode = "";
  final int _otpCodeLength = 4;
  String phoneNumber = "0938372719";
  Timer? _timer;
  int _countDown = 15; // 1 phút 30 giây
  bool canResend = false;
  late FocusNode myFocusNode;
  Key _pinFieldKey = UniqueKey();

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _resendOTP() {
    if (canResend) {
      setState(() {
        _countDown = 15; // Reset lại thời gian đếm ngược
        canResend = false;

        _otpCode = '';
        _pinFieldKey = UniqueKey(); // Cập nhật key để widget không rebuild
      });
    }
    startTimer();
  }

  @override
  void initState() {
    startTimer();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    SmsAutoFill().listenForCode.call();
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    _timer!.cancel();
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   backgroundColor: Colors.transparent,
    //   //   elevation: 0,
    //   //   foregroundColor: Colors.black,
    //   // ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 15),
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Align(
    //             alignment: Alignment.topLeft,
    //             child: Text(
    //               "Forget Password",
    //               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 60,
    //           ),
    //           Align(
    //             alignment: Alignment.topLeft,
    //             child: Text(
    //               "Please enter your OTP",
    //               style: TextStyle(fontSize: 15),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           TextFieldPin(
    //               textController: textEditingController,
    //               autoFocus: false,
    //               codeLength: 4,
    //               alignment: MainAxisAlignment.center,
    //               defaultBoxSize: 55.0,
    //               margin: 10,
    //               selectedBoxSize: 50.0,
    //               textStyle: TextStyle(fontSize: 16),
    //               defaultDecoration: _pinPutDecoration.copyWith(
    //                   border: Border.all(color: Colors.grey)),
    //               selectedDecoration: _pinPutDecoration,
    //               onChange: (code) {
    //                 setState(() {});
    //               }),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => RecoveryScreen(),
    //                   ));
    //             },
    //             child: Text(
    //               "Verify",
    //               style: TextStyle(color: Colors.white),
    //             ),
    //             style: ElevatedButton.styleFrom(
    //                 minimumSize: Size.fromHeight(55),
    //                 backgroundColor: Color(0xFFDB3022),
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(8))),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isButtonEnabled = _otpCode.length == _otpCodeLength && _countDown > 0;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "AdminExpress",
                          style: GoogleFonts.raleway().copyWith(
                              fontSize: 48,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                color: Colors.amber,
                child: Stack(
                  children: [
                    // ! [Image Decoration]
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Image(
                    //     image: AssetImage(
                    //         "assets/images/_project/Account/corgi_dog.png"),
                    //     width: 250,
                    //   ),
                    // ),

                    //! [Input Form]
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.2,
                          ),

                          // ? [Input Form/Content]
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? height * 0.032
                                        : height * 0.12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // TODO [Input Form/Content/Intro Text]
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "",
                                          style: GoogleFonts.raleway().copyWith(
                                              fontSize: 35.0,
                                              color: textColor1,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        TextSpan(
                                          text: "Verification Code",
                                          style: GoogleFonts.raleway().copyWith(
                                              fontSize: 35.0,
                                              color: textColor2,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'We have sent the code verification to',
                                    style: GoogleFonts.raleway().copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.009,
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        phoneNumber,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(0, 0),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        " Change your number",
                                        style: GoogleFonts.raleway().copyWith(
                                          fontSize: 16.0,
                                          color: textColor2,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.034,
                                ),

                                // TODO [Input Form/Content/Form]
                                Form(
                                  key: globalKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 80, // Chiều cao mong muốn
                                        child: PinFieldAutoFill(
                                          key: _pinFieldKey,
                                          currentCode: _otpCode,
                                          codeLength: _otpCodeLength,
                                          onCodeChanged: (code) {
                                            setState(() {
                                              _otpCode = code ?? '';
                                            });
                                            if (code?.length ==
                                                _otpCodeLength) {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                            }
                                          },
                                          decoration: BoxLooseDecoration(
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                            strokeColorBuilder:
                                                FixedColorBuilder(
                                              const Color.fromARGB(
                                                      31, 179, 19, 19)
                                                  .withOpacity(0.3),
                                            ),
                                            gapSpace: 13,
                                          ),
                                        ),
                                      ),

                                      //TODO[Input Form/Content/Form/Resend and Timer]
                                      SizedBox(
                                        height: height * 0.017,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${(_countDown ~/ 60).toString().padLeft(2, '0')}:${(_countDown % 60).toString().padLeft(2, '0')}',
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Didn't receive otp? ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              canResend
                                                  ? InkWell(
                                                      onTap: () {
                                                        _resendOTP();
                                                      },
                                                      child: Text("Resend"),
                                                    )
                                                  : Text(
                                                      "Resend",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )
                                            ],
                                          )
                                        ],
                                      ),

                                      // TODO [Input Form/Content/Form/Button]
                                      SizedBox(
                                        height: height * 0.01,
                                      ),

                                      MouseRegion(
                                        cursor: isButtonEnabled
                                            ? SystemMouseCursors.click
                                            : SystemMouseCursors.forbidden,
                                        child: GestureDetector(
                                          onTap: isButtonEnabled
                                              ? () {
                                                  if (globalKey.currentState!
                                                      .validate()) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      content: Text(
                                                          "Trying to Login"),
                                                    ));
                                                    Navigator.of(context)
                                                        .pushReplacementNamed(
                                                            Routes.sign_in);
                                                  }
                                                }
                                              : null,
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: isButtonEnabled
                                                  ? primaryColorOrange
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Đăng ký",
                                                style: GoogleFonts.raleway()
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
