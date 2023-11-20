import 'package:get/get.dart';

import '../controllers/viewpage_controller.dart';

class ViewpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewpageController>(
      () => ViewpageController(),
    );
  }
}
