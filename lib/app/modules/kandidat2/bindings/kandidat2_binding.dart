import 'package:get/get.dart';

import '../controllers/kandidat2_controller.dart';

class Kandidat2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Kandidat2Controller>(
      () => Kandidat2Controller(),
    );
  }
}
