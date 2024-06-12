import 'package:get/get.dart';

class TrackOrderControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}

class TrackOrderController extends GetxController {
  static TrackOrderController get to => Get.find();
}
