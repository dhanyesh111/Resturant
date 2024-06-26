import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddNewUpiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewUpiController());
  }
}

class AddNewUpiController extends GetxController {
  static AddNewUpiController get to => Get.find();
  TextEditingController controllerUpiID = TextEditingController();
  GlobalKey<FormState> addNewUpiFormKey = GlobalKey();
}
