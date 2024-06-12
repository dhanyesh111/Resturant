import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_routes/app_routes.dart';
import 'package:restaurant/assets/icons.dart';

import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';
import '../assets/images.dart';
import '../text_form_fields/text_form_fields.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              FoodImage1(),
              FoodImage2(),
              Container(
                height: Get.height,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.sp,
                    ),
                    Text(
                      "Welcome back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30.sp,
                          color: AppColors.white),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      "Please login to your account",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15.sp, color: AppColors.grey132),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    AppTextFormFieldPassword(
                        controller: LoginController.to.controllerEmail,
                        header: "Email"),
                    SizedBox(
                      height: 20.sp,
                    ),
                    AppTextFormFieldPassword(
                        controller: LoginController.to.controllerPassword,
                        header: "Password"),
                    SizedBox(
                      height: 100.sp,
                    ),
                    SolidButton(
                      text: "Login",
                      width: 300.sp,
                      onTap: () => Get.toNamed(AppRoutes.register),
                    ),
                    SizedBox(
                      height: 183.sp,
                    ),
                    LoginWithGoogle(),
                    SizedBox(
                      height: 10.sp,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Don't have account ?", children: [
                          TextSpan(
                              text: " Sign Up",
                              style: TextStyle(color: AppColors.red183))
                        ]))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.google,
          height: 20.sp,
        ),
        SizedBox(
          width: 10.sp,
        ),
        Text(" Login with Google",
            style: TextStyle(fontSize: 15.sp, color: AppColors.white))
      ],
    );
  }
}

class FoodImage1 extends StatelessWidget {
  const FoodImage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 40.sp,
        left: -180.sp,
        child: Hero(
          tag: AppImages.foodBackground3,
          child: Image.asset(
            AppImages.foodBackground3,
            height: 300.sp,
            width: 300.sp,
          ),
        ));
  }
}

class FoodImage2 extends StatelessWidget {
  const FoodImage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -150.sp,
        right: -150.sp,
        child: Hero(
          tag: AppImages.foodBackground2,
          child: Image.asset(
            AppImages.foodBackground2,
            height: 300.sp,
            width: 300.sp,
          ),
        ));
  }
}
