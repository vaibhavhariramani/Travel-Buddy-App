import 'package:get/get.dart';

import '../controllers/splitwise_controller.dart';

class SplitwiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplitwiseController>(
      () => SplitwiseController(),
    );
  }
}
