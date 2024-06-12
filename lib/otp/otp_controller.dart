import 'package:get/get.dart';

class OtpControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}

class OtpController extends GetxController {
  static OtpController get to => Get.find();
}
