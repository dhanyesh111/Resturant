import 'package:get/get.dart';

class SelectTableControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectTableController());
  }
}

class SelectTableController extends GetxController {
  static SelectTableController get to => Get.find();
}
