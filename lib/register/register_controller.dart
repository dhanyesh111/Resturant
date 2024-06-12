import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
}
