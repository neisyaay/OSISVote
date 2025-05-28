import 'package:get/get.dart';

import '../controllers/quickcount_controller.dart';

class QuickcountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuickcountController>(
      () => QuickcountController(),
    );
  }
}
