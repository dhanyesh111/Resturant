import 'package:get/get.dart';

class ReservationListingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReservationListingController());
  }
}

class ReservationListingController extends GetxController {
  static ReservationListingController get to => Get.find();
}
