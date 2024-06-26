import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_colors/app_colors.dart';

class AddNewCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewCardController());
  }
}

enum CardType { none, visa, mastercard }

class AddNewCardController extends GetxController {
  static AddNewCardController get to => Get.find();
  Rx<CardType> cardType = CardType.none.obs;
  TextEditingController controllerCardNumber = TextEditingController();

  TextEditingController controllerNameOnCard = TextEditingController();
  TextEditingController controllerCvv = TextEditingController();

  GlobalKey<FormState> addNewCardFormKey = GlobalKey();
  Rx<DateTime?> expiryYear = Rx<DateTime?>(null);
  Rx<DateTime?> expiryMonth = Rx<DateTime?>(null);
  List<DateTime> yearList = List.generate(
      10, (index) => DateTime.now().add(Duration(days: index * 365)));
  List<DateTime> monthList = List.generate(
          12, (index) => DateTime(2000, 1, 1).add(Duration(days: index * 28)))
      .toList();

  RxString cardNumber = "XXXX  XXXX  XXXX  1234".obs;
  RxString nameOnCard = "USER NAME".obs;
  RxString cvv = "XXX".obs;
  List<List<Color>> cardColors = [
    [
      AppColors.violet44,
      AppColors.violet84,
    ],
    [
      AppColors.black,
      AppColors.black32,
    ],
    [
      AppColors.blue24,
      AppColors.blue53,
    ],
    [
      AppColors.black,
      AppColors.red253,
    ],
    [
      AppColors.grey72,
      AppColors.grey132,
    ]
  ];
  Rx<List<Color>?> selectedColor = Rx<List<Color>?>(null);
}
