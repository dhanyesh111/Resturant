import 'package:get/get.dart';

class PreviousOrderControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreviousOrderController());
  }
}

class PreviousOrderController extends GetxController {
  static PreviousOrderController get to => Get.find();
}
