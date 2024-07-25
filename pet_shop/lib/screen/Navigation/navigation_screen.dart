import 'dart:io';
import 'dart:typed_data';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_shop/config/secure_storage/security_storage.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';
import 'package:pet_shop/controllers/Predict/predict_controller.dart';
import 'package:pet_shop/controllers/Product/cart_controller.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/ModelPredict/model_product.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/CartAndPayment/cart_screen.dart';
import 'package:pet_shop/screen/Home/home_screen.dart';
import 'package:pet_shop/screen/Order/order_screen.dart';
import 'package:pet_shop/screen/Profile/FavScreen/favorite_screen.dart';
import 'package:pet_shop/screen/Profile/profile_screen.dart';
import 'package:oktoast/oktoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shop/servies/ModelPredict/predict_service.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  //todo [Predict]
  String isImageUploaded = "";
  bool isLoading = false;
  final ImagePicker picker = ImagePicker();

  List<Widget> pages = [
    HomeScreen(),
    // CartScreen(),
    OrderScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  //Pick and Take options
  Uint8List? _image;
  File? selectedIMage;
  void _onItemTapped(int index) async {
    // if (index != 0 && AuthController.instance.isLogin == false) {
    if (index != 0 &&
        await SecurityStorage().readSecureData("token") == false) {
      Navigator.of(context).pushNamed(Routes.sign_in);
    } else {
      setState(() {
        pageIndex = index;
        ProductController.instance.getAllFavoriteProduct();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          // todo: [Scan dog action]
          onPressed: () {
            // checkpermission_opencamera();
            showImagePickerOption(context);
            // Navigator.of(context).pushNamed(Routes.recognize_model);
          },
          child: Icon(
            Icons.qr_code,
            size: 20,
          ),
          backgroundColor: Color(0xFFDB3022),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //     icons: [
      //       CupertinoIcons.house_alt_fill,
      //       // CupertinoIcons.cart_fill,
      //       CupertinoIcons.rectangle_on_rectangle_angled,
      //       CupertinoIcons.heart_fill,
      //       CupertinoIcons.profile_circled,
      //     ],
      //     inactiveColor: Colors.black.withOpacity(0.5),
      //     activeColor: Color(0xFFDB3022),
      //     gapLocation: GapLocation.center,
      //     activeIndex: pageIndex,
      //     notchSmoothness: NotchSmoothness.softEdge,
      //     leftCornerRadius: 10,
      //     iconSize: 25,
      //     rightCornerRadius: 10,
      //     elevation: 0,
      //     onTap: (index) {
      //       _onItemTapped;
      //       ProductController.instance.getAllFavoriteProduct();
      //     }
      //     // (index) {
      //     //   ,
      //     //   setState(() {
      //     //     pageIndex = index;
      //     //   });
      //     // },
      //     ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          CupertinoIcons.house_alt_fill,
          CupertinoIcons.rectangle_on_rectangle_angled,
          CupertinoIcons.heart_fill,
          CupertinoIcons.profile_circled,
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
        onTap: _onItemTapped,
      ),
    );
  }

  // todo: [Check Permission]
  checkpermission_opencamera() async {
    var cameraStatus = await Permission.camera.status;
    var microphoneStatus = await Permission.microphone.status;

    //cameraStatus.isGranted == has access to application
    //cameraStatus.isDenied == does not have access to application, you can request again for the permission.
    //cameraStatus.isPermanentlyDenied == does not have access to application, you cannot request again for the permission.
    //cameraStatus.isRestricted == because of security/parental control you cannot use this permission.
    //cameraStatus.isUndetermined == permission has not asked before.

    if (!cameraStatus.isGranted) await Permission.camera.request();
    // if (!microphoneStatus.isGranted) await Permission.microphone.request();

    if (await Permission.camera.isGranted) {
      // if (await Permission.microphone.isGranted) {
      // } else {
      //   showToast(
      //       "Camera needs to access your microphone, please provide permission",
      //       position: ToastPosition.bottom);
      // }
      // openCamera();
      _pickImageFromCamera();
    } else {
      showToast("Provide Camera permission to use camera.",
          position: ToastPosition.bottom);
    }
  }

  check_gallerry_permission() async {
    if (await Permission.storage.request().isGranted) {
      _pickImageFromGallery();
    } else {
      print('No permission provided');
    }
  }

  void openCamera() {
    Navigator.of(context).pushNamed(Routes.scanner);
  }

  // void requestCameraPermission() async {
  //   var status = await Permission.camera.request();
  //   if (status.isDenied) {
  //     //Handle Denied
  //     showToast("Camera");
  //   } else if (status.isPermanentlyDenied) {
  //     //Permissiobn permanently denied, show Dialog or redirect to app settings
  //   } else if (status.isGranted) {
  //     //proceed with camera
  //   }
  // }

  // todo [Options pick]
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  IconPicker(
                    check_gallerry_permission,
                    // _pickImageFromGallery,
                    Text("Gallery"),
                    Icons.image,
                  ),
                  IconPicker(
                    checkpermission_opencamera,
                    Text("Camera"),
                    Icons.camera_alt_rounded,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Expanded IconPicker(void Function() function, Text named, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () {
          function();
        },
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 65,
                color: Colors.black,
              ),
              named, // Sử dụng Text widget đã được truyền vào
            ],
          ),
        ),
      ),
    );
  }

  //todo [Pick Action]
  //Gallery
  Future _pickImageFromGallery() async {
    // final returnImage = await ImagePicker()
    //     .pickImage(source: ImageSource.gallery, imageQuality: 50);
    // if (returnImage == null) return;
    // setState(() {
    //   selectedIMage = File(returnImage.path);
    //   _image = File(returnImage.path).readAsBytesSync();
    // });
    // Navigator.of(context).pop();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // setState(() {
      //   isLoading = true;
      // });

      // Uint8List bytes = await image.readAsBytes();
      Navigator.of(context).pushNamed(Routes.pred_list, arguments: image);
      // PredictController.instance.predict(bytes, image.name);

      // if (PredictController.instance.predList.isNotEmpty) {
      //   for (var i = 0; i < PredictController.instance.predList.length; i++) {
      //     print(PredictController.instance.predList[i]);
      //   }
      //   Navigator.of(context).pushNamed(Routes.pred_list,
      //       arguments: PredictController.instance.predList);
      //   // await predictImage(bytes, image.name);
      // }
    } else {
      print("jjjjjjjjjjjjjjjjjjjjjjjj");
    }
  }

  //Camera
  Future _pickImageFromCamera() async {
    // final returnImage =
    //     await ImagePicker().pickImage(source: ImageSource.camera);
    // if (returnImage == null) return;
    // setState(() {
    //   selectedIMage = File(returnImage.path);
    //   _image = File(returnImage.path).readAsBytesSync();
    // });
    // Navigator.of(context).pop();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // setState(() {
      //   isLoading = true;
      // });
      // Uint8List bytes = await image.readAsBytes();
      // await predictImage(bytes, image.name);
      Navigator.of(context).pushNamed(Routes.pred_list, arguments: image);
    }
  }

  //todo [Predict]
  Future<void> predictImage(Uint8List bytes, String fileName) async {
    // print("Predicting image: $fileName");
    // var predictionResult = await UploadApiImage().uploadImage(bytes, fileName);
    // if (predictionResult != null) {
    //   setState(() {
    //     // Update UI with prediction result if needed
    //     print("Prediction result: $predictionResult");
    //     Navigator.of(context).pushReplacementNamed('/');
    //     isLoading = false;
    //   });
    // } else {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   print("Failed to predict image.");
    // }
  }

  // void _imgFromGallery() async {
  //   await ImagePicker()
  //       .pickImage(source: ImageSource.camera, imageQuality: 50)
  //       .then((value) => {
  //             if (value != null)
  //               {
  //                 // _cropImage(File(value.path))
  //               }
  //           });
  // }
}
