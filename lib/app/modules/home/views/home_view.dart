import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../../homescreen/views/homescreen_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// Logo with animated Colorize text
    Widget splasher = SplashScreenView(
      navigateRoute: HomescreenView(),
      duration: 2000,
      imageSize: 130,
      imageSrc: "splashscreen_image.png",
      text: "TravelBuddy App",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash screen',
      home: splasher,
    );
  }
}
