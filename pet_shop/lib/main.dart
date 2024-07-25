import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_shop/config/secure_storage/security_storage.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  await Hive.initFlutter();
  // Set up the SettingsController,  which will glue user settings to multiple
  // Flutter Widgets.

  // !!!!! Setting notification
  final settingsController = SettingsController(SettingsService());
  // Load the user's preferred the  me while the splash screen is displayed.
  // SecurityStorage().deleteSecureData("token");
  // SecurityStorage().deleteSecureData("phone");
  // SecurityStorage().deleteSecureData("username");
  // SecurityStorage().deleteSecureData("image");
  // SecurityStorage().deleteSecureData("password");
  // SecurityStorage().deleteSecureData("id");
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  //Transparent battery bar
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  // !loading
  confidLoading();
  runApp(MyApp(settingsController: settingsController));
}




// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> _allChips = [
//     'Portland',
//     'Biking',
//     'Nature',
//     'Nightlife',
//     'November'
//   ];
//   List<String> _selectedChips = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Photo Info'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Implement search functionality
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: _selectedChips.map((chip) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                     child: Chip(
//                       label: Text(chip),
//                       onDeleted: () {
//                         setState(() {
//                           _selectedChips.remove(chip);
//                         });
//                       },
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Divider(),
//             Wrap(
//               spacing: 8.0,
//               children: _allChips.map((chip) {
//                 return ChoiceChip(
//                   label: Text(chip),
//                   selected: _selectedChips.contains(chip),
//                   onSelected: (isSelected) {
//                     setState(() {
//                       if (isSelected) {
//                         _selectedChips.add(chip);
//                       } else {
//                         _selectedChips.remove(chip);
//                       }
//                     });
//                   },
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
