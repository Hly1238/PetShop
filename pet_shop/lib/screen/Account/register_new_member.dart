import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/config/responsive/responsive_widget.dart';
import 'package:pet_shop/config/validators/validation.dart';

import 'package:http/http.dart' as http;
import 'package:pet_shop/route/route_generator.dart';

class RegisterNewMember extends StatefulWidget {
  const RegisterNewMember({Key? key}) : super(key: key);

  @override
  _RegisterNewMemberState createState() => _RegisterNewMemberState();
}

class _RegisterNewMemberState extends State<RegisterNewMember> {
  bool isAPIcallProcess = false;
  String? username;
  String? password;

  //Form
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _isObscured;
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _isObscured = true;
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

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
                      alignment: Alignment.topRight,
                      child: Image(
                        image: AssetImage(
                            "assets/images/_project/Account/login-dog-2.png"),
                        width: 350,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: AssetImage(
                            "assets/images/_project/Account/login-dog-1.png"),
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
                                          text: "Hi ",
                                          style: GoogleFonts.raleway().copyWith(
                                              fontSize: 35.0,
                                              color: textColor1,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        TextSpan(
                                          text: "You!",
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
                                    'Hey, Please tell me your information \nto let us know you more.',
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
                                          "Username",
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
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          hintText: 'Enter email/phone number',
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
                                            child: Icon(Icons.email_outlined),
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
                                        keyboardType: TextInputType.phone,
                                        autofillHints: [AutofillHints.username],
                                        validator: (name) =>
                                            TValidation.validatePhoneNumber(
                                                name),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Password",
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
                                        controller: _passwordController,
                                        focusNode: _passwordFocusNode,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          hintText: 'Enter Password',
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
                                            child: Icon(
                                                Icons.lock_outline_rounded),
                                          ),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(end: 12.0),
                                            child: IconButton(
                                              icon: Icon(
                                                _isObscured
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: Color(0xAAAA000000),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscured = !_isObscured;
                                                });
                                              },
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
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) =>
                                            TValidation.validatePassword(value),
                                        obscureText: _isObscured,
                                        onEditingComplete: () =>
                                            TextInput.finishAutofillContext(),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Password",
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
                                        controller: _passwordController,
                                        focusNode: _passwordFocusNode,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          hintText: 'Confirm Password',
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
                                            child: Icon(
                                                Icons.lock_outline_rounded),
                                          ),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(end: 12.0),
                                            child: IconButton(
                                              icon: Icon(
                                                _isObscured
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: Color(0xAAAA000000),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscured = !_isObscured;
                                                });
                                              },
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
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) =>
                                            TValidation.validatePassword(value),
                                        obscureText: _isObscured,
                                        onEditingComplete: () =>
                                            TextInput.finishAutofillContext(),
                                      ),

                                      // TODO [Input Form/Content/Form/Button]
                                      SizedBox(
                                        height: height * 0.04,
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
                                                "Sign In",
                                                style: GoogleFonts.raleway()
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // TODO [Input Form/Content/Form/Sign Up]
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Haven't got any account? ",
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
                                                      Routes.sign_up);
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size(0, 0),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            child: Text(
                                              "Register Now",
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
}
