import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/assets/icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            AppColors.black21.withOpacity(.9),
            AppColors.black,
          ])),
      child: Image.asset(AppIcons.appIcon),
    ));
  }
}
