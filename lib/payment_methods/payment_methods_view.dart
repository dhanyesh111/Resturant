import 'package:flutter/material.dart';
import 'package:restaurant/app_bar/app_bars.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Payment  Options",
        ),
        body: ListView(
          children: [],
        ));
  }
}
