import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaddingWrapper extends StatelessWidget {
  final bool isSliverItem;
  final dynamic child;

  final double? topPadding;
  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? horizontalPadding;

  const PaddingWrapper({
    Key? key,
    required this.isSliverItem,
    required this.child,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.leftPadding,
    this.rightPadding,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSliverItem) {
      return SliverPadding(
        padding: EdgeInsets.only(
          left: leftPadding ?? horizontalPadding ?? Get.width * 0.05,
          top: topPadding!,
          right: rightPadding ?? horizontalPadding ?? Get.width * 0.05,
          bottom: bottomPadding!,
        ),
        sliver: child,
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
          left: leftPadding ?? horizontalPadding ?? Get.width * 0.05,
          top: topPadding!,
          right: rightPadding ?? horizontalPadding ?? Get.width * 0.05,
          bottom: bottomPadding!,
        ),
        child: child,
      );
    }
  }
}
