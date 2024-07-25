// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //       body: Center(
//   //     child: Text('Profile Screen'),
//   //   ));
//   // }
//   String? userId;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 355,
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       height: 300,
//                       width: MediaQuery.of(context).size.width,
//                       color: Colors.blue,
//                       alignment: Alignment.center,
//                       child: FadeInImage(
//                         height: double.infinity,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                         placeholder: const AssetImage(
//                             'assets/images/_project/Logo/logo.png'),
//                         image: const AssetImage(
//                             'assets/images/_project/Logo/logo.png'),
//                         imageErrorBuilder: (context, error, stackTrace) =>
//                             Image.asset(
//                           'assets/images/_project/Logo/logo.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {},
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.white, width: 1),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(300),
//                               child: SizedBox(
//                                 height: 100,
//                                 width: 100,
//                                 child: FadeInImage(
//                                   fit: BoxFit.cover,
//                                   placeholder: const AssetImage(
//                                       'assets/images/_project/Logo/logo.png'),
//                                   image: const AssetImage(
//                                       'assets/images/_project/Logo/logo.png'),
//                                   imageErrorBuilder:
//                                       (context, error, stackTrace) =>
//                                           Image.asset(
//                                     'assets/images/_project/Logo/logo.png',
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Username",
//                           style: const TextStyle(
//                               color: Color(0xff04236c),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'User information',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xff1b2794),
//                         fontSize: 20),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(top: 8),
//                     padding: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         color: const Color(0xffd0d4ec),
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: const Color(0xff647ebb),
//                         ),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Color(0xffc8d7ef),
//                               blurRadius: 20.0,
//                               offset: Offset(0, 10))
//                         ]),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           padding: const EdgeInsets.all(8.0),
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                   bottom:
//                                       BorderSide(color: Color(0xff647ebb)))),
//                           child: GestureDetector(
//                             onTap: () async {
//                               TextEditingController textController =
//                                   TextEditingController();
//                               await showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                   title: const Text('Change Username'),
//                                   content: TextField(
//                                     controller: textController,
//                                     autofocus: true,
//                                     decoration: const InputDecoration(
//                                         hintText: "Enter your new name"),
//                                   ),
//                                   actions: <Widget>[
//                                     TextButton(
//                                       style: TextButton.styleFrom(
//                                         textStyle: Theme.of(context)
//                                             .textTheme
//                                             .labelLarge,
//                                       ),
//                                       child: const Text('Cancel'),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                     ),
//                                     TextButton(
//                                       style: TextButton.styleFrom(
//                                         textStyle: Theme.of(context)
//                                             .textTheme
//                                             .labelLarge,
//                                       ),
//                                       child: const Text('Confirm'),
//                                       onPressed: () async {
//                                         if (textController.text.isNotEmpty) {}
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                             child: ListTile(
//                               title: const Text(
//                                 'Username',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff1b2794)),
//                               ),
//                               subtitle: Text(
//                                 "Username",
//                                 style:
//                                     const TextStyle(color: Color(0xff2c38a4)),
//                               ),
//                               trailing: const Icon(Icons.navigate_next),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(8.0),
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                   bottom:
//                                       BorderSide(color: Color(0xff647ebb)))),
//                           child: ListTile(
//                             title: const Text(
//                               'Email',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xff1b2794)),
//                             ),
//                             subtitle: Text(
//                               "email@gmail.com",
//                               style: const TextStyle(color: Color(0xff2c38a4)),
//                             ),
//                             trailing: const Icon(Icons.navigate_next),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return const SimpleDialog(
//                                   title: Text(
//                                     'Change Password',
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.w600),
//                                   ),
//                                   children: [UpdatePasswordForm()],
//                                 );
//                               },
//                             );
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(8.0),
//                             child: const ListTile(
//                               title: Text(
//                                 'Password',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff1b2794)),
//                               ),
//                               trailing: Icon(Icons.navigate_next),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   SizedBox(
//                     width: double.maxFinite,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           elevation: 2,
//                           backgroundColor: const Color(0xffe2e9ff),
//                           shape: RoundedRectangleBorder(
//                             side: const BorderSide(color: Color(0xff647ebb)),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         onPressed: () async {},
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'Log out',
//                             style: TextStyle(
//                                 color: Color(0xff1b2794), fontSize: 24),
//                           ),
//                         )),
//                   ),
//                   const SizedBox(
//                     height: 70,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class UpdatePasswordForm extends StatefulWidget {
//   const UpdatePasswordForm({super.key});

//   @override
//   State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
// }

// class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? newPassword;
//   String? oldPassword;
//   String? renewPassword;
//   String error = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Form(
//         key: _formKey,
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width * 0.75,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(color: Colors.grey)),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }

//                   return null;
//                 },
//                 onSaved: (newValue) {
//                   oldPassword = newValue;
//                 },
//               ),
//               TextFormField(
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                     labelText: 'New Password',
//                     labelStyle: TextStyle(color: Colors.grey)),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   if (newPassword != renewPassword) {
//                     return 'New password now match with re new password';
//                   }

//                   return null;
//                 },
//                 onSaved: (newValue) {
//                   newPassword = newValue;
//                 },
//               ),
//               TextFormField(
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                     labelStyle: TextStyle(color: Colors.grey)),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   if (newPassword != renewPassword) {
//                     return 'New password now match with re new password';
//                   }
//                   return null;
//                 },
//                 onSaved: (newValue) {
//                   renewPassword = newValue;
//                 },
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Text(
//                 error,
//                 style: const TextStyle(color: Colors.red),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 width: double.maxFinite,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       shadowColor: Colors.black,
//                       elevation: 2,
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           side: const BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(8))),
//                   onPressed: () async {
//                     _formKey.currentState!.save();
//                     if (_formKey.currentState!.validate()) {
//                       bool isValid = true;
//                     }
//                   },
//                   child: const Text(
//                     'Submit',
//                     style:
//                         TextStyle(color: Colors.black, fontFamily: "Pacifico"),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';
import 'package:pet_shop/models/Account/user_model.dart';
import 'package:pet_shop/route/route_generator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController authController = Get.find<AuthController>();
  bool _enNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: FadeInImage(
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder:
                            AssetImage('assets/images/_project/Logo/logo.png'),
                        image: NetworkImage("userInfo.image"),
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/_project/Logo/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {},
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300),
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: AssetImage(
                                      'assets/images/_project/Logo/logo.png'),
                                  image: NetworkImage("userInfo.image"),
                                  imageErrorBuilder:
                                      (context, error, stackTrace) =>
                                          Image.asset(
                                    'assets/images/_project/Logo/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "userInfo.username",
                          style: const TextStyle(
                              color: Color(0xff04236c),
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 13,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Column(children: <Widget>[
                      ExpansionTile(
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black26,
                          size: 27,
                        ),
                        title: _buildSelectionSetting(
                            Icons.person, "User Profile", null, null),
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black))),
                                  child: GestureDetector(
                                    onTap: () async {
                                      TextEditingController textController =
                                          TextEditingController();
                                      await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Change Username'),
                                          content: TextField(
                                            controller: textController,
                                            autofocus: true,
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Enter your new name"),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                              child: const Text('Confirm'),
                                              onPressed: () async {
                                                if (textController
                                                    .text.isNotEmpty) {}
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      title: const Text(
                                        'Username',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff1b2794)),
                                      ),
                                      subtitle: Text(
                                        "userInfo.username",
                                        style: const TextStyle(
                                            color: Color(0xff2c38a4)),
                                      ),
                                      trailing: const Icon(Icons.navigate_next),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black))),
                                  child: ListTile(
                                    title: const Text(
                                      'Email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1b2794)),
                                    ),
                                    subtitle: Text(
                                      "userInfo.email",
                                      style: const TextStyle(
                                          color: Color(0xff2c38a4)),
                                    ),
                                    trailing: const Icon(Icons.navigate_next),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const SimpleDialog(
                                          title: Text(
                                            'Change Password',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          children: [UpdatePasswordForm()],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const ListTile(
                                      title: Text(
                                        'Password',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff1b2794)),
                                      ),
                                      trailing: Icon(Icons.navigate_next),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                      const Divider(
                          height: 0,
                          endIndent: 25,
                          indent: 5,
                          thickness: 0.1,
                          color: Colors.black),
                      ListTile(
                        contentPadding: EdgeInsets.all(15),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.notifications,
                                    color: Colors.black38),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Notification",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            CupertinoSwitch(
                              value: _enNotification,
                              onChanged: (value) {
                                setState(() {
                                  _enNotification = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                          height: 0,
                          endIndent: 25,
                          indent: 5,
                          thickness: 0.1,
                          color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          setState(() async {
                            authController.isLogin.value = false;
                            // Navigate to login screen or any other screen after logout
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.homepage);
                          });
                        },
                        child: _buildSelectionSetting(Icons.logout, "Sign out",
                            null, Icons.arrow_forward_ios),
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 13,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      child: Column(children: <Widget>[
                        _buildSelectionSetting(Icons.info_outline,
                            "Information", null, Icons.arrow_forward_ios),
                      ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionSetting(
      IconData icon, String name, String? selection, IconData? postIcon) {
    if (postIcon != null) {
      return ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black38),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                Text(selection ?? "",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  postIcon,
                  color: Colors.black26,
                  size: 15,
                ),
              ],
            )
            // DropdownButton(items: language, onChanged: null)
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black38),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                Text(selection ?? "",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    )),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
            // DropdownButton(items: language, onChanged: null)
          ],
        ),
      );
    }
  }
}

class UpdatePasswordForm extends StatefulWidget {
  const UpdatePasswordForm({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? newPassword;
  String? oldPassword;
  String? renewPassword;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  oldPassword = newValue;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'New Password',
                    labelStyle: TextStyle(color: Colors.grey)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  newPassword = newValue;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Re-enter Password',
                    labelStyle: TextStyle(color: Colors.grey)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  renewPassword = newValue;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          _formKey.currentState?.save();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(16)),
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
