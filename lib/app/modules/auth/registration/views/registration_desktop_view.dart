import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../constants/constants.dart';
import '../../../widgets/padding_wrapper.dart';
import '../../../widgets/scroll_wrapper.dart';
import '../controllers/registration_controller.dart';
import 'registration_widgets/step1.dart';
import 'registration_widgets/step2.dart';

class RegistrationDesktopView extends GetView<RegistrationController> {
  RegistrationController regController = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    return ScrollWrapper(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      slivers: [_buildRegistercard(context)],
    );
  }

  Widget _buildRegistercard(BuildContext context) {
    Size size = Get.size;
    Rx<Option> selectedOption = Option.step2.obs;
    return PaddingWrapper(
      leftPadding: Get.width * 0.01,
      rightPadding: Get.width * 0.01,
      isSliverItem: true,
      child: SliverFillRemaining(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              // Flexible(
              //   child: Container(
              //     height: double.infinity,
              //     width: Get.width * 0.98,
              //     color: kPrimaryColor,
              //   ),
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: AppColors.greencard,
                        child: SizedBox(
                          width: Get.width * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/cucumialogo.png",
                                  width: Get.width * 0.1,
                                ),
                                Expanded(
                                  child: Obx(
                                    () => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipPath(
                                            clipper: regController
                                                    .isStep1Completed.isFalse
                                                ? ArcClipper()
                                                : null,
                                            child: Container(
                                              color: Theme.of(context)
                                                  .cardTheme
                                                  .color,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8,
                                                    8,
                                                    regController
                                                            .isStep1Completed
                                                            .isFalse
                                                        ? 38
                                                        : 8,
                                                    8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "1  Basic Details",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "   shop Name,city,Contact number",
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .disabledColor,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    regController
                                                            .isStep1Completed
                                                            .isTrue
                                                        ? const CircleAvatar(
                                                            maxRadius: 15,
                                                            backgroundColor:
                                                                Colors.green,
                                                            child: Icon(
                                                              Icons.done,
                                                              color:
                                                                  Colors.white,
                                                              size: 15,
                                                            ),
                                                          )
                                                        : Container()
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipPath(
                                            clipper: regController
                                                    .isStep1Completed.isTrue
                                                ? ArcClipper()
                                                : null,
                                            child: Container(
                                              color: Theme.of(context)
                                                  .cardTheme
                                                  .color,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 8, 38, 8),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "2  Shop Details",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "    shop Address,photos,Opening",
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .disabledColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   child: Text(
                                        //     "It's easy and takes less than 30 seconds",
                                        //     maxLines: 2,
                                        //     style: TextStyle(
                                        //       color: Colors.white,
                                        //       fontSize: 10,
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const Align(
              //   alignment: Alignment.topRight,
              //   child: Padding(
              //     padding: EdgeInsets.all(32),
              //     child: Icon(
              //       Icons.menu,
              //       color: Color(0xFFFE4350),
              //       size: 28,
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Padding(
              //     padding: EdgeInsets.all(32),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: const [
              //         Icon(
              //           Icons.copyright,
              //           color: Colors.grey,
              //           size: 24,
              //         ),
              //         SizedBox(
              //           width: 8,
              //         ),
              //         Text(
              //           "Copyright 2020",
              //           style: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 14,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),

                  //Animation 1
                  //transitionBuilder: (widget, animation) => RotationTransition(
                  //  turns: animation,
                  //  child: widget,
                  //),
                  //switchOutCurve: Curves.easeInOutCubic,
                  //switchInCurve: Curves.fastLinearToSlowEaseIn,

                  //Animation 2
                  transitionBuilder: (widget, animation) =>
                      ScaleTransition(child: widget, scale: animation),
                  child: selectedOption.value == Option.step2
                      ? Align(alignment: Alignment.topRight, child: Step1())
                      : Step2(
                          onLogInSelected: () =>
                              selectedOption.value = Option.step2,
                        )),
            ],
          ),
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 30, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
