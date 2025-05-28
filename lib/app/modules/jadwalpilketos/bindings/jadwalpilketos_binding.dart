import 'package:get/get.dart';

import '../controllers/jadwalpilketos_controller.dart';

class JadwalpilketosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalpilketosController>(
      () => JadwalpilketosController(),
    );
  }
}
