import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CartProductModel {
  String image;
  double price;
  String name;
  RxInt itemCount;
  CartProductModel({
    required this.name,
    required this.price,
    required this.itemCount,
    required this.image,
  });
}

class PaymentDetails {
  String text;
  int value;
  PaymentDetails({required this.text, required this.value});
}

class DeliveryInstructionModel {
  IconData icon;
  String text;
  String description;
  RxBool isSelected;
  DeliveryInstructionModel({
    required this.icon,
    required this.text,
    required this.description,
    required this.isSelected,
  });
}
