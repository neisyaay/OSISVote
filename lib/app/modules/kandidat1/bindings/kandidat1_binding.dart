import 'package:get/get.dart';

import '../controllers/kandidat1_controller.dart';

class Kandidat1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Kandidat1Controller>(
      () => Kandidat1Controller(),
    );
  }
}
