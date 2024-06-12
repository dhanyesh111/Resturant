import 'package:get/get.dart';

class OrderFoodOnboardingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderFoodOnboardingController());
  }
}

class OrderFoodOnboardingController extends GetxController {
  static OrderFoodOnboardingController get to => Get.find();
}
