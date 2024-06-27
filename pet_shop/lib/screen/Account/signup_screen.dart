import 'dart:convert';
import 'dart:io';

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

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //Signup Input
  TextEditingController emailController = TextEditingController();
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

  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "FullName": "091232434",
        "Email": "admin5@gmail.com",
        "PhoneNumber": "091232434",
        "Password": "091232434",
        "Otp": "JWUIj2"
      };

      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   // return Material(
  //   //   child: SingleChildScrollView(
  //   //     child: SafeArea(
  //   //       child: Column(
  //   //         mainAxisAlignment: MainAxisAlignment.center,
  //   //         children: [
  //   //           SizedBox(
  //   //             height: 100,
  //   //           ),
  //   //           //Pic
  //   //           Container(
  //   //             child: Image.asset(
  //   //                 "assets/images/_project/Account/login_background.jpg"),
  //   //             height: 300,
  //   //           ),
  //   //           SizedBox(
  //   //             height: 3,
  //   //           ),
  //   //           //Input
  //   //           Padding(
  //   //             padding: const EdgeInsets.symmetric(horizontal: 25),
  //   //             child: Column(
  //   //               children: [
  //   //                 TextFormField(
  //   //                   controller: nameController,
  //   //                   decoration: InputDecoration(
  //   //                       labelText: "Enter Name",
  //   //                       border: OutlineInputBorder(),
  //   //                       prefixIcon: Icon(Icons.person)),
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 15,
  //   //                 ),
  //   //                 TextFormField(
  //   //                   controller: emailController,
  //   //                   keyboardType: TextInputType.emailAddress,
  //   //                   decoration: InputDecoration(
  //   //                       labelText: "Enter Email",
  //   //                       border: OutlineInputBorder(),
  //   //                       prefixIcon: Icon(Icons.email_rounded)),
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 15,
  //   //                 ),
  //   //                 TextFormField(
  //   //                   controller: phoneNumberController,
  //   //                   keyboardType: TextInputType.phone,
  //   //                   decoration: InputDecoration(
  //   //                       labelText: "Enter Phone Number",
  //   //                       border: OutlineInputBorder(),
  //   //                       prefixIcon: Icon(Icons.phone)),
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 15,
  //   //                 ),
  //   //                 TextFormField(
  //   //                   controller: passwordController,
  //   //                   obscureText: true,
  //   //                   decoration: InputDecoration(
  //   //                       labelText: "Enter Password",
  //   //                       border: OutlineInputBorder(),
  //   //                       prefixIcon: Icon(Icons.lock),
  //   //                       suffixIcon: Icon(Icons.remove_red_eye)),
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 15,
  //   //                 ),
  //   //                 TextFormField(
  //   //                   controller: passwordConfirmController,
  //   //                   obscureText: true,
  //   //                   decoration: InputDecoration(
  //   //                       labelText: "Confirm Password",
  //   //                       border: OutlineInputBorder(),
  //   //                       prefixIcon: Icon(Icons.lock),
  //   //                       suffixIcon: Icon(Icons.remove_red_eye)),
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 15,
  //   //                 ),
  //   //                 ElevatedButton(
  //   //                   onPressed: () {
  //   //                     registerUser();
  //   //                     // Navigator.push(
  //   //                     //     context,
  //   //                     //     MaterialPageRoute(
  //   //                     //       builder: (context) => NavigationScreen(),
  //   //                     //     ));
  //   //                   },
  //   //                   child: Text(
  //   //                     "Sign up",
  //   //                     style: TextStyle(color: Colors.white),
  //   //                   ),
  //   //                   style: ElevatedButton.styleFrom(
  //   //                       minimumSize: Size.fromHeight(55),
  //   //                       backgroundColor: Color(0xFFEf6969),
  //   //                       shape: RoundedRectangleBorder(
  //   //                           borderRadius: BorderRadius.circular(8))),
  //   //                 ),
  //   //                 SizedBox(
  //   //                   height: 20,
  //   //                 ),
  //   //                 Text(
  //   //                   "OR",
  //   //                 ),
  //   //                 Row(
  //   //                   mainAxisAlignment: MainAxisAlignment.center,
  //   //                   children: [
  //   //                     Text(
  //   //                       "Already have an account?",
  //   //                       style: TextStyle(color: Colors.black54, fontSize: 15),
  //   //                     ),
  //   //                     TextButton(
  //   //                         onPressed: () {
  //   //                           Navigator.push(
  //   //                               context,
  //   //                               MaterialPageRoute(
  //   //                                   builder: (context) => LoginScreen()));
  //   //                         },
  //   //                         child: Text(
  //   //                           "Login",
  //   //                           style: TextStyle(
  //   //                               color: Color.fromARGB(137, 238, 42, 42),
  //   //                               fontSize: 15,
  //   //                               fontWeight: FontWeight.bold),
  //   //                         ))
  //   //                   ],
  //   //                 )
  //   //               ],
  //   //             ),
  //   //           )
  //   //         ],
  //   //       ),
  //   //     ),
  //   //   ),
  //   // );
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
                      alignment: Alignment.bottomRight,
                      child: Image(
                        image: AssetImage(
                            "assets/images/_project/Account/dog_sunglasses.png"),
                        width: 300,
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
                                          text: "Welcome!",
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
                                    'Welcome! PetShop provides you \nall stuffs you want for your \'Best Friends\'',
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
                                        maxLength: 11,
                                        controller: _userController,
                                        focusNode: _userFocusNode,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          hintText: 'Enter phone number',
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
                                            child: Icon(Icons.phone),
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
                                          AutofillHints.telephoneNumber
                                        ],
                                        keyboardType: TextInputType.phone,
                                        validator: (name) =>
                                            TValidation.validatePhoneNumber(
                                                name),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),

                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.start,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: [
                                      //     Flexible(
                                      //       child: Container(
                                      //         height: 56,
                                      //         // width: 50,
                                      //         margin: EdgeInsets.fromLTRB(
                                      //             0, 10, 3, 30),
                                      //         decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(4),
                                      //           border: Border.all(
                                      //               color: Colors.grey),
                                      //         ),
                                      //         child: Center(
                                      //           child: Text(
                                      //             "+84",
                                      //             style: TextStyle(
                                      //                 color: Colors.black,
                                      //                 fontWeight:
                                      //                     FontWeight.bold),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Flexible(
                                      //       flex: 6,
                                      //       child: Container(
                                      //         margin: EdgeInsets.fromLTRB(
                                      //             3, 10, 0, 0),
                                      //         child:
                                      //             // TextFormField(
                                      //             //   maxLines: 1,
                                      //             //   maxLength: 10,
                                      //             //   decoration: InputDecoration(
                                      //             //     contentPadding:
                                      //             //         EdgeInsets.all(6),
                                      //             //     hintText: "Mobile Phone",
                                      //             //     enabledBorder:
                                      //             //         OutlineInputBorder(
                                      //             //       borderSide: BorderSide(
                                      //             //           color: Colors.grey,
                                      //             //           width: 1),
                                      //             //     ),
                                      //             //     border: OutlineInputBorder(
                                      //             //       borderSide: BorderSide(
                                      //             //           color: Colors.grey,
                                      //             //           width: 1),
                                      //             //     ),
                                      //             //     focusedBorder:
                                      //             //         OutlineInputBorder(
                                      //             //       borderSide: BorderSide(
                                      //             //           color: Colors.blue,
                                      //             //           width: 1),
                                      //             //     ),
                                      //             //   ),
                                      //             //   keyboardType:
                                      //             //       TextInputType.number,
                                      //             // ),
                                      //             TextFormField(
                                      //           maxLength: 10,
                                      //           controller: _userController,
                                      //           focusNode: _userFocusNode,
                                      //           decoration: InputDecoration(
                                      //             border: OutlineInputBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       5.0),
                                      //             ),
                                      //             hintText:
                                      //                 'Enter phone number',
                                      //             focusedBorder:
                                      //                 OutlineInputBorder(
                                      //               borderSide: BorderSide(
                                      //                   color: Colors.orange,
                                      //                   width: 2.0),
                                      //             ),
                                      //             contentPadding:
                                      //                 EdgeInsets.symmetric(
                                      //                     vertical: 20.0,
                                      //                     horizontal: 10.0),
                                      //           ),
                                      //           keyboardType:
                                      //               TextInputType.number,
                                      //           // validator: (name) => TValidation
                                      //           //     .validatePhoneNumber(name),
                                      //           autovalidateMode:
                                      //               AutovalidateMode
                                      //                   .onUserInteraction,
                                      //         ),
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),

                                      // TODO [Input Form/Content/Form/Forget Password]
                                      SizedBox(
                                        height: height * 0.009,
                                      ),
                                      // TODO [Input Form/Content/Form/Button]
                                      SizedBox(
                                        height: height * 0.01,
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Already have an account? ",
                                            style:
                                                GoogleFonts.raleway().copyWith(
                                              fontSize: 16.0,
                                              color: textColor1,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      Routes.sign_in);
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size(0, 0),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            child: Text(
                                              "Sign In Now",
                                              style: GoogleFonts.raleway()
                                                  .copyWith(
                                                fontSize: 16.0,
                                                color: textColor2,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ],
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
