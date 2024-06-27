import 'package:flutter/material.dart';
import 'package:pet_shop/screen/Account/forget_screen.dart';
import 'package:pet_shop/screen/Account/login_screen.dart';
import 'package:pet_shop/screen/Account/otp_verify_screen.dart';
import 'package:pet_shop/screen/Account/preAccess.dart';
import 'package:pet_shop/screen/Account/recovery_screen.dart';
import 'package:pet_shop/screen/Account/register_new_member.dart';
import 'package:pet_shop/screen/Account/signup_screen.dart';
import 'package:pet_shop/screen/Camera/camera_screen.dart';
import 'package:pet_shop/screen/Home/components/carousel_slider/carousel_loading.dart';
import 'package:pet_shop/screen/Navigation/navigation_screen.dart';
import 'package:pet_shop/screen/Product/components/product_card_vertical.dart';
import 'package:pet_shop/screen/SplashScreen/on_boarding.dart';
import 'package:pet_shop/screen/SplashScreen/splash_screen.dart';
import 'package:pet_shop/screen/tmp/snack_bar.dart';

class Routes {
  static const String homepage = "/";
  static const String onBoarding = "/on_boarding";
  static const String splashScreen = "/splash_screen";
  static const String sign_in = "/signin";
  static const String sign_up = "/signup";
  static const String forget_password = "/forget_password";
  static const String recovery_password = "/recovery_password";
  static const String register_member = "/register_member";
  static const String otp_verified = "/otp_verified";
  static const String camera = "/camera";
  static const String snackBarScreen = "/test";
  static const String productCard = "/product_card";
  static const String preAccessScreen = "/pre";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/splash_screen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/on_boarding':
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case Routes.homepage:
        return MaterialPageRoute(builder: (_) => NavigationScreen());
      case Routes.sign_in:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.sign_up:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case Routes.forget_password:
        return MaterialPageRoute(builder: (_) => ForgetScreen());
      case Routes.recovery_password:
        return MaterialPageRoute(builder: (_) => RecoveryScreen());
      case Routes.register_member:
        return MaterialPageRoute(builder: (_) => RegisterNewMember());
      case Routes.camera:
        return MaterialPageRoute(builder: (_) => CameraScreen());
      case Routes.productCard:
        return MaterialPageRoute(builder: (_) => CarouselLoading());
      case '/test':
        return MaterialPageRoute(builder: (_) => SnackBarScreen());
      case '/pre':
        return MaterialPageRoute(builder: (_) => PreAccess());

      case Routes.otp_verified:
        return MaterialPageRoute(builder: (_) => OtpVerifyScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
