import 'package:get/get.dart';

class PaymentMethodsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodsController());
  }
}

class PaymentMethodsController extends GetxController {
  static PaymentMethodsController get to => Get.find();
}
