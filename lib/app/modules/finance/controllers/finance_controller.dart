import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinanceController extends GetxController {
  //TODO: Implement FinanceController
  TextEditingController dateInput = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    dateInput.text = "";
  }

  // @override
  // void initState() {
  //   //set the initial value of text field

  //   super.initState();
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
