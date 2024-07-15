import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Center(
  //     child: Text('Profile Screen'),
  //   ));
  // }
  String? userId;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 355,
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
                        placeholder: const AssetImage(
                            'assets/images/_project/Logo/logo.png'),
                        image: const AssetImage(
                            'assets/images/_project/Logo/logo.png'),
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
                                  placeholder: const AssetImage(
                                      'assets/images/_project/Logo/logo.png'),
                                  image: const AssetImage(
                                      'assets/images/_project/Logo/logo.png'),
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
                          "Username",
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
                  const Text(
                    'User information',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1b2794),
                        fontSize: 20),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color(0xffd0d4ec),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xff647ebb),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffc8d7ef),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0xff647ebb)))),
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
                                        hintText: "Enter your new name"),
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
                                        if (textController.text.isNotEmpty) {}
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
                                "Username",
                                style:
                                    const TextStyle(color: Color(0xff2c38a4)),
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
                                      BorderSide(color: Color(0xff647ebb)))),
                          child: ListTile(
                            title: const Text(
                              'Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1b2794)),
                            ),
                            subtitle: Text(
                              "email@gmail.com",
                              style: const TextStyle(color: Color(0xff2c38a4)),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: const Color(0xffe2e9ff),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xff647ebb)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: Color(0xff1b2794), fontSize: 24),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpdatePasswordForm extends StatefulWidget {
  const UpdatePasswordForm({super.key});

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
                  if (newPassword != renewPassword) {
                    return 'New password now match with re new password';
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
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.grey)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (newPassword != renewPassword) {
                    return 'New password now match with re new password';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  renewPassword = newValue;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 2,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () async {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      bool isValid = true;
                    }
                  },
                  child: const Text(
                    'Submit',
                    style:
                        TextStyle(color: Colors.black, fontFamily: "Pacifico"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
