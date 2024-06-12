import 'package:get/get.dart';
import 'package:restaurant/app_routes/app_routes.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    splashConfig();
  }

  splashConfig() => Future.delayed(
      const Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.onboarding));
}
