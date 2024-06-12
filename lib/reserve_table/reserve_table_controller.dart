import 'package:get/get.dart';

class ReserveTableControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReserveTableController());
  }
}

class ReserveTableController extends GetxController {
  static ReserveTableController get to => Get.find();
}
