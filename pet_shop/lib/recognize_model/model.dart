// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';
// import 'package:image_picker/image_picker.dart';

// class Model extends StatefulWidget {
//   const Model({Key? key}) : super(key: key);

//   @override
//   _ModelState createState() => _ModelState();
// }

// class _ModelState extends State<Model> {
//   bool isLoading = true;
//   File? _image;
//   List? _output;
//   final picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     loadModel().then((value) {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() async {
//     super.dispose();
//     await Tflite.close();
//   }

//   void pickImage(ImageSource source) async {
//     var image = await picker.pickImage(source: source);
//     if (image == null) return;
//     setState(() {
//       _image = File(image.path);
//       isLoading = true; // Reset loading state
//     });
//     detectImage(_image!);
//   }

//   // void detectImage(File image) async {
//   //   var output = await Tflite.runModelOnImage(
//   //     path: image.path,
//   //     numResults: 2,
//   //     threshold: 0.6,
//   //     imageMean: 0.0,
//   //     imageStd: 255.0,
//   //   );
//   //   setState(() {
//   //     isLoading = false;
//   //     _output = output!;
//   //   });
//   // }

//   Future detectImage(File image) async {
//     int startTime = new DateTime.now().millisecondsSinceEpoch;
//     var recognitions = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 6,
//       threshold: 0.05,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       isLoading = false;
//       _output = recognitions;
//     });
//     int endTime = new DateTime.now().millisecondsSinceEpoch;
//     print("Inference took ${endTime - startTime}ms");
//   }

//   Future<void> loadModel() async {
//     Tflite.close();
//     try {
//       await Tflite.loadModel(
//         // model: "assets/images/_project/Model/tf_lite_quant_model.tflite",
//         model: "assets/images/_project/Model/tf_lite_model.tflite",
//         labels: "assets/images/_project/Model/labels.txt",
//         numThreads: 1,
//         isAsset: true,
//         useGpuDelegate: false,
//       );
//     } catch (e) {
//       print("Failed to load model: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 50),
//             Text("Coding Cafe"),
//             SizedBox(height: 5),
//             Text('Cats and Dogs Detector App'),
//             SizedBox(height: 50),
//             Center(
//               child: isLoading
//                   ? Container(
//                       width: 350,
//                       child: Column(
//                         children: [
//                           Image.asset(
//                             "assets/images/_project/Account/black_dog.png",
//                             height: 250,
//                           ),
//                           SizedBox(height: 50),
//                         ],
//                       ),
//                     )
//                   : Container(
//                       width: 350,
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 250,
//                             child: Image.file(_image!),
//                           ),
//                           SizedBox(height: 20),
//                           _output != null
//                               ? Text('${_output![0]['label']}')
//                               : Container(),
//                         ],
//                       ),
//                     ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       pickImage(ImageSource.camera);
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width - 250,
//                       alignment: Alignment.center,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.yellow,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text("Capture"),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () {
//                       pickImage(ImageSource.gallery);
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width - 250,
//                       alignment: Alignment.center,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.yellow,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text("Pick"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
