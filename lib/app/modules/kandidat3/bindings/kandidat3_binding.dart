import 'package:get/get.dart';

import '../controllers/kandidat3_controller.dart';

class Kandidat3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Kandidat3Controller>(
      () => Kandidat3Controller(),
    );
  }
}
