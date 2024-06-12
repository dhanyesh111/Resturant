import 'package:get/get.dart';

import 'onboarding_model.dart';

class OnboardingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();
  List<OnBoardingItemModel> images = [
    OnBoardingItemModel(
        images: [
          "https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ],
        header: "Plan Your weekly menu",
        body:
            "You can order weekly meals and we,ll bring\nthen straight to your door"),
    OnBoardingItemModel(
        images: [
          "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1592861956120-e524fc739696?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ],
        header: "Reserve a table",
        body: "Tired of having to wait? Make a table\nreservation right away"),
    OnBoardingItemModel(
        images: [
          "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1544148103-0773bf10d330?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ],
        header: "Place catering Order",
        body: "Place catering Order with us and \nmake functions easier  ")
  ];

  RxInt currentIndex = 0.obs;
}
