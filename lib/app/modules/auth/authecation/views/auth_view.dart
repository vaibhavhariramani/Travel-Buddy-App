import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'You need to be signed in to use this application',
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
            ),
          ),
          TextButton.icon(
            onPressed: signIn,
            icon: Icon(Icons.person),
            label: Text('GOOGLE SIGN IN'),
          ),
        ]),
      ),
    );
  }
}
