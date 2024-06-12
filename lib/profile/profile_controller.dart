import 'package:get/get.dart';

class ProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
}
