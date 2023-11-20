import 'package:flutter_dashboard/flutter_dashboard.dart';
import 'package:get/get.dart';

import '../forms/registration_form1.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController
  final FormGroup editForm = RegistrationForms.RegistrationForm;
  final RxBool isStep1Completed = false.obs;
  final RxBool isRestaurant = false.obs;
  final isEditing = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
