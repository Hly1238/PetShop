import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/Account/recovery_screen.dart';
import 'package:pet_shop/screen/Account/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/Account/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/config/responsive/responsive_widget.dart';
import 'package:pet_shop/config/validators/validation.dart';

import 'package:http/http.dart' as http;

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  bool clrBtn = false;
  TextEditingController emailController = TextEditingController();

  //Signup Input
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool _isNotValidate = false;

  //Form
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.transparent,
  //       elevation: 0,
  //       leading: BackButton(),
  //       foregroundColor: Colors.black,
  //     ),
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: Column(
  //           // crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Align(
  //               alignment: Alignment.topLeft,
  //               child: Text(
  //                 "Forgot Password",
  //                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 60,
  //             ),
  //             Text(
  //               "Please enter your number. You will receive a OTP to create or set a new password via number",
  //               style: TextStyle(fontSize: 15),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             TextFormField(
  //               controller: emailController,
  //               onChanged: (val) {
  //                 if (val != "") {
  //                   setState(() {
  //                     clrBtn = true;
  //                   });
  //                 }
  //               },
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(),
  //                 labelText: "Email",
  //                 suffix: InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       emailController.clear();
  //                     });
  //                   },
  //                   child: Icon(
  //                     CupertinoIcons.multiply,
  //                     color: Color(0xFFDB3022),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 50,
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => RecoveryScreen(),
  //                     ));
  //               },
  //               child: Text(
  //                 "Send Code",
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                   minimumSize: Size.fromHeight(55),
  //                   backgroundColor: Color(0xFFDB3022),
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8))),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 Text("OR"),
  //                 TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context)
  //                           .pushReplacementNamed(Routes.otp_verified);
  //                     },
  //                     child: Text(
  //                       "Veryfy Using Number",
  //                       style: TextStyle(
  //                           color: Color(0xFFDB3022),
  //                           fontSize: 15,
  //                           fontWeight: FontWeight.bold),
  //                     ))
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: AssetImage(
                            "assets/images/_project/Account/corgi_dog.png"),
                        width: 250,
                      ),
                    ),

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
                                          text: "Forget Password!",
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
                                    'Please enter your number or email.\nYou will receive a OTP to create or set a new password.',
                                    style: GoogleFonts.raleway().copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
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
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Phone Number",
                                          style: GoogleFonts.raleway().copyWith(
                                              fontSize: 16.0,
                                              color: textColor1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      TextFormField(
                                        controller: _userController,
                                        focusNode: _userFocusNode,
                                        onChanged: (val) {
                                          if (val != "") {
                                            setState(() {
                                              clrBtn = true;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          hintText:
                                              'Enter phone number/email address',
                                          prefixIcon: Container(
                                            margin: const EdgeInsets.only(
                                                right: 16.0),
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                    width: 1.0,
                                                    color: Color(0xAAAA000000)),
                                              ),
                                            ),
                                            child: Icon(Icons.person_2_rounded),
                                          ),
                                          suffix: InkWell(
                                            onTap: () {
                                              setState(() {
                                                _userController.clear();
                                              });
                                            },
                                            child: Icon(
                                              CupertinoIcons.multiply,
                                              color: Color(0xFFDB3022),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.orange,
                                                width: 2.0),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0,
                                              horizontal:
                                                  10.0), // Điều chỉnh padding để tăng kích thước input
                                        ),
                                        autofillHints: [
                                          AutofillHints.telephoneNumber,
                                          AutofillHints.email
                                        ],
                                        validator: (name) =>
                                            TValidation.validatePhoneNumber(
                                                name),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),

                                      // TODO [Input Form/Content/Form/Button]
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors
                                            .click, // Thay đổi con trỏ chuột thành hình bàn tay
                                        child: GestureDetector(
                                          onTap: () {
                                            if (globalKey.currentState!
                                                .validate()) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Trying to Login"),
                                              ));
                                              Navigator.of(context).pushNamed(
                                                  Routes.otp_verified);
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: primaryColorOrange,
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
                                      // TODO [Input Form/Content/Form/Sign In]
                                      SizedBox(
                                        height: height * 0.03,
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
  //Handle Sign Up
}
