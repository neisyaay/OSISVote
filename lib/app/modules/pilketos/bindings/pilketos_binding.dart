import 'package:get/get.dart';

import '../controllers/pilketos_controller.dart';

class PilketosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilketosController>(
      () => PilketosController(),
    );
  }
}
