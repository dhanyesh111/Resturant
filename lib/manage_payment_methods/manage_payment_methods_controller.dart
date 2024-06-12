import 'package:get/get.dart';

class ManagePaymentMethodsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagePaymentMethodsController());
  }
}

class ManagePaymentMethodsController extends GetxController {
  static ManagePaymentMethodsController get to => Get.find();
}
