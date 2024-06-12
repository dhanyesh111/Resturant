import 'package:get/get.dart';

class BillingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillingController());
  }
}

class BillingController extends GetxController {
  static BillingController get to => Get.find();
}
