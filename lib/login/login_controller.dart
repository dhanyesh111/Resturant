import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
}
