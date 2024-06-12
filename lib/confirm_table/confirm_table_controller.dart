import 'package:get/get.dart';

class ConfirmTableControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmTableController());
  }
}

class ConfirmTableController extends GetxController {
  static ConfirmTableController get to => Get.find();
}
