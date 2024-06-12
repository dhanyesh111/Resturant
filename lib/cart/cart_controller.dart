import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_model.dart';

class CartControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}

class CartController extends GetxController {
  static CartController get to => Get.find();
  RxBool isLoading = false.obs;
  RxList<CartProductModel> productList = <CartProductModel>[
    CartProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: "Burger",
      itemCount: 1.obs,
      price: 200,
    ),
    CartProductModel(
      image:
          "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0",
      name: "Burger",
      itemCount: 1.obs,
      price: 200,
    ),
  ].obs;

  List<PaymentDetails> paymentDetails = <PaymentDetails>[
    PaymentDetails(text: "GST", value: 30),
    PaymentDetails(text: "Delivery partner fee for 8km", value: 40)
  ];
  List<int> tipOptions = [10, 20, 50];
  Rx<int?> selectedTipOptions = Rx<int?>(null);
  List<DeliveryInstructionModel> deliveryInstruction =
      <DeliveryInstructionModel>[
    DeliveryInstructionModel(
        text: "Avoid\nringing bell",
        icon: Icons.notifications_active,
        isSelected: false.obs,
        description: "Delivery Partner will not ring door bell"),
    DeliveryInstructionModel(
        text: "Leave\nat the door",
        icon: Icons.home_filled,
        isSelected: false.obs,
        description: "Delivery Partner will leave package at door step"),
    DeliveryInstructionModel(
        text: "Avoid\nCalling",
        icon: Icons.phone,
        isSelected: false.obs,
        description: "Delivery Partner will call to your mobile number"),
    DeliveryInstructionModel(
        text: "Leave\nwith security       ",
        icon: Icons.local_police_outlined,
        isSelected: false.obs,
        description: "Delivery Partner will leave package with security guard"),
  ];
  String cardNumber = "8973";
}
