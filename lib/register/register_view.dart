import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_buttons/app_buttons.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/register/register_controller.dart';
import 'package:restaurant/text_form_fields/text_form_fields.dart';

import '../assets/images.dart';
import '../login/login_view.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
              bottom: -150.sp,
              left: -150.sp,
              child: Hero(
                tag: AppImages.foodBackground3,
                child: Image.asset(
                  AppImages.foodBackground3,
                  height: 300.sp,
                  width: 300.sp,
                ),
              )),
          Positioned(
              top: -150.sp,
              right: -150.sp,
              child: Hero(
                tag: AppImages.foodBackground2,
                child: Image.asset(
                  AppImages.foodBackground2,
                  height: 300.sp,
                  width: 300.sp,
                ),
              )),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 40.sp),
            shrinkWrap: true,
            children: [
              Container(
                height: 70.sp,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: AppColors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Text(
                "Create a new account",
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
                "Please fill in the form to continue",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, color: AppColors.grey132),
              ),
              SizedBox(
                height: 30.sp,
              ),
              AppTextFormField(
                  controller: RegisterController.to.controllerFullName,
                  header: "Full Name"),
              SizedBox(
                height: 20.sp,
              ),
              AppTextFormField(
                  controller: RegisterController.to.controllerFullName,
                  header: "Email"),
              SizedBox(
                height: 20.sp,
              ),
              AppTextFormField(
                  controller: RegisterController.to.controllerFullName,
                  header: "Phone Number"),
              SizedBox(
                height: 20.sp,
              ),
              AppTextFormFieldPassword(
                  controller: RegisterController.to.controllerFullName,
                  header: "Password"),
              SizedBox(
                height: 40.sp,
              ),
              SolidButton(
                text: "Sign In",
                width: 300.sp,
                onTap: () => Get.back(),
              ),
              SizedBox(
                height: 60.sp,
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
        ],
      ),
    ));
  }
}
//
