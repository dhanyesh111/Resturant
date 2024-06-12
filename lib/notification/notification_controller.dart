import 'package:get/get.dart';

class NotificationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
}
