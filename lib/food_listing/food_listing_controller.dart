import 'package:get/get.dart';

class FoodListingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodListingController());
  }
}

class FoodListingController extends GetxController {
  static FoodListingController get to => Get.find();
}
