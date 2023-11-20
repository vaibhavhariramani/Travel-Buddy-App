import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import 'authecation/controllers/auth_controller.dart';

class AuthSocialMediaButtons extends GetWidget<AuthService> {
  final ValueChanged<bool> isProcessing;
  final AuthController authController = Get.put(AuthController());

  AuthSocialMediaButtons({
    Key? key,
    required this.isProcessing,
  }) : super(key: key);

  void _navigateScreen() async {
    String? _afterLoginRoute;

    if (Get.parameters.containsKey('then')) {
      _afterLoginRoute = Get.parameters['then'];
    }
    Get.log("2" + _afterLoginRoute.toString());
    if (_afterLoginRoute != null) {
      if (_afterLoginRoute == "2" || _afterLoginRoute == "3") {
        Get.find<DashboardController>()
            .changeTab(int.tryParse(_afterLoginRoute)!);
        Get.back();
      } else {
        Get.back();
      }
    } else {
      Get.offNamed(Routes.DASHBOARD);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          // visible: Platform.isIOS,
          visible: false,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildButton(
                context,
                onPressed: () async {
                  isProcessing(true);
                  await controller.globalLogin(loginby: "apple").then(
                    (_response) {
                      isProcessing(_response);
                      if (_response) {
                        _navigateScreen();
                      }
                    },
                  );
                },
                icon: 'assets/icons/apple.png',
              ),
              SizedBox(
                width: Get.width * 0.15,
              ),
            ],
          ),
        ),
        Visibility(
          visible: true,
          child: _buildButton(
            context,
            onPressed: () async {
              isProcessing(true);
              await controller.globalLogin(loginby: "facebook").then(
                (_response) {
                  isProcessing(_response);
                  if (_response) {
                    _navigateScreen();
                  }
                },
              );
            },
            icon: 'assets/icons/facebook.png',
          ),
        ),
        // SizedBox(
        //   width: Get.width * 0.15,
        // ),
        Visibility(
          visible: true,
          child: _buildButton(
            context,
            onPressed: () async {
              isProcessing(true);
              await controller.globalLogin(loginby: "google").then(
                (_response) {
                  isProcessing(_response);
                  if (_response) {
                    _navigateScreen();
                  }
                },
              );
            },
            icon: 'assets/icons/google.png',
          ),
        ),
        Visibility(
          visible: true,
          child: _buildButton(
            context,
            icon: !authController.mobileloginbool.value
                ? 'assets/icons/ic_call.png'
                : 'assets/icons/ic_email.png',
            onPressed: () async {
              print("mobile login button is pressed");
              // isProcessing(true);
              // await controller.globalLogin(loginby: "facebook").then(
              //   (_response) {
              //     isProcessing(_response);
              //     if (_response) {
              //       _navigateScreen();
              //     }
              //   },
              // );

              // Toggle the mobileloginbool variable
              authController.mobileloginbool.toggle().obs;
              print(
                  "authController.mobileloginbool value now is ${authController.mobileloginbool.value}");
            },
          ),
        ),
      ],
    );
  }
}

Widget _buildButton(
  BuildContext context, {
  required VoidCallback onPressed,
  required String icon,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Material(
      shape: const CircleBorder(),
      color: Theme.of(context).brightness == Brightness.dark
          ? CardTheme.of(context).color
          : Colors.transparent,
      elevation: 2,
      type: Get.isDarkMode ? MaterialType.card : MaterialType.canvas,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: Get.isDarkMode
              ? null
              : const LinearGradient(
                  colors: [LightColors.ice_blue_two, LightColors.ice_blue_two],
                  stops: [0, 1],
                  begin: Alignment(-0.67, -0.74),
                  end: Alignment(0.67, 0.74),
                ),
          boxShadow: Get.isDarkMode
              ? null
              : const [
                  BoxShadow(
                    color: LightColors.white_57,
                    offset: Offset(0, -19),
                    blurRadius: 72,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: LightColors.white_15,
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  )
                ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.02),
            child: Image.asset(
              icon,
              scale: 1,
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
    ),
  );
}
