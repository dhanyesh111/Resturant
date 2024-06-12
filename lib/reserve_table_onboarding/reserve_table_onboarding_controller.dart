import 'package:get/get.dart';

class ReserveTableOnboardingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReserveTableOnboardingController());
  }
}

class ReserveTableOnboardingController extends GetxController {
  static ReserveTableOnboardingController get to => Get.find();
}
