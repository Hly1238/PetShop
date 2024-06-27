import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pet_shop/screen/Navigation/navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  int _currentPage = 0;

  final pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    bodyTextStyle: TextStyle(fontSize: 19),
    bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  @override
  void initState() {
    super.initState();
    _storeOnBoardInfo();
  }

  _storeOnBoardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoard', true);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, right: 16),
          child: _currentPage < 2
              ? TextButton(
                  onPressed: () {
                    _introKey.currentState?.skipToEnd();
                  },
                  child:
                      const Text("Skip", style: TextStyle(color: Colors.black)),
                )
              : SizedBox.shrink(), // Hide the button on the last page
        ),
      ),
      pages: [
        PageViewModel(
          title: "Shop Now",
          bodyWidget: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 19, color: Colors.black),
              children: [
                TextSpan(text: 'Bringing home a pet is a '),
                TextSpan(
                  text: 'life changing experience',
                  style: TextStyle(color: Colors.orange),
                ),
                TextSpan(text: ' that only spreads joy'),
              ],
            ),
          ),
          image: Image.asset(
            "assets/images/_project/On_Boarding/on_boarding_1.jpg",
            width: 450,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of orange text and bold page",
          body:
              "This is a description on a page with an orange title and bold, big body.",
          image: const Center(
            child: Text("👋", style: TextStyle(fontSize: 100.0)),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        PageViewModel(
            title: "Shop Now",
            body:
                "Bringing home a pet is a life changing experience that only spreads joy",
            image: Image.asset(
              "assets/images/_project/On_Boarding/on_boarding_2.jpg",
              width: 450,
            ),
            decoration: pageDecoration,
            footer: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 50),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Text(
                  "Let's shop",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    backgroundColor: Color(0xFFDB3022),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            )),
      ],
      showSkipButton: false, // Disable the default skip button
      showDoneButton: true,
      showBackButton: false,
      done: const Text("Done"),
      next: const Text("Next",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFDB3022))),
      onDone: () async {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => NavigationScreen(),
        //   ),
        // );
        Navigator.of(context).pushReplacementNamed('/');
      },
      onSkip: () {},
      dotsDecorator: DotsDecorator(
          size: Size.square(10),
          activeSize: Size(20, 10),
          activeColor: Color(0xFFDB3022),
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onChange: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }
}
