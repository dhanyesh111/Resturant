import 'package:get/get.dart';

class SelectRestaurantControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectRestaurantController());
  }
}

class SelectRestaurantController extends GetxController {
  static SelectRestaurantController get to => Get.find();
}
