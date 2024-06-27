import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/CartAndPayment/cart_screen.dart';
import 'package:pet_shop/screen/Home/home_screen.dart';
import 'package:pet_shop/screen/Profile/favorite_screen.dart';
import 'package:pet_shop/screen/Profile/profile_screen.dart';
import 'package:oktoast/oktoast.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {
            checkpermission_opencamera();
          },
          child: Icon(
            Icons.qr_code,
            size: 20,
          ),
          backgroundColor: Color(0xFFDB3022),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            CupertinoIcons.house_alt_fill,
            CupertinoIcons.cart_fill,
            CupertinoIcons.heart_fill,
            CupertinoIcons.profile_circled
          ],
          inactiveColor: Colors.black.withOpacity(0.5),
          activeColor: Color(0xFFDB3022),
          gapLocation: GapLocation.center,
          activeIndex: pageIndex,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          iconSize: 25,
          rightCornerRadius: 10,
          elevation: 0,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          }),
    );
  }

  checkpermission_opencamera() async {
    var cameraStatus = await Permission.camera.status;
    var microphoneStatus = await Permission.microphone.status;

    print(cameraStatus);
    print(microphoneStatus);
    //cameraStatus.isGranted == has access to application
    //cameraStatus.isDenied == does not have access to application, you can request again for the permission.
    //cameraStatus.isPermanentlyDenied == does not have access to application, you cannot request again for the permission.
    //cameraStatus.isRestricted == because of security/parental control you cannot use this permission.
    //cameraStatus.isUndetermined == permission has not asked before.

    if (!cameraStatus.isGranted) await Permission.camera.request();

    if (!microphoneStatus.isGranted) await Permission.microphone.request();

    // //Step 2:
    // if (cameraStatus.isGranted) {
    //   //Proceed with camera-related task
    // } else if (cameraStatus.isDenied) {
    //   requestCameraPermission();
    // }

    if (await Permission.camera.isGranted) {
      if (await Permission.microphone.isGranted) {
        openCamera();
      } else {
        showToast(
            "Camera needs to access your microphone, please provide permission",
            position: ToastPosition.bottom);
      }
    } else {
      showToast("Provide Camera permission to use camera.",
          position: ToastPosition.bottom);
    }
  }

  void openCamera() {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Trying to Login"),
    //   ),
    // );
    Navigator.of(context).pushNamed(Routes.camera);
  }

  checkpermission_phone_logs() async {
    if (await Permission.phone.request().isGranted) {
      openPhonelogs();
    } else {
      showToast("Provide Phone permission to make a call and view logs.",
          position: ToastPosition.bottom);
    }
  }

  void openPhonelogs() {}

  void requestCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isDenied) {
      //Handle Denied
      showToast("Camera");
    } else if (status.isPermanentlyDenied) {
      //Permissiobn permanently denied, show Dialog or redirect to app settings
    } else if (status.isGranted) {
      //proceed with camera
    }
  }
}
