import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class AppThemes {
  static AppBarTheme appBarTheme = AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(fontSize: 20.sp, color: AppColors.white));

  static CardTheme cardTheme = CardTheme(surfaceTintColor: AppColors.white);
  static DialogTheme dialogTheme =
      DialogTheme(surfaceTintColor: AppColors.white);
  // static DatePickerThemeData datePickerThemeData = DatePickerThemeData(
  //     backgroundColor: AppColors.white,
  //     surfaceTintColor: AppColors.white,
  //     todayBackgroundColor: MaterialStateProperty.resolveWith((states) =>
  //         states.contains(MaterialState.selected) ? AppColors.green0 : null),
  //     cancelButtonStyle: ButtonStyle(
  //         foregroundColor: MaterialStateProperty.all(AppColors.black),
  //         textStyle: MaterialStateProperty.all(
  //             const TextStyle(fontWeight: FontWeight.w700))),
  //     confirmButtonStyle: ButtonStyle(
  //         foregroundColor: MaterialStateProperty.all(AppColors.black),
  //         textStyle: MaterialStateProperty.all(
  //             const TextStyle(fontWeight: FontWeight.w700))),
  //     todayBorder: BorderSide(color: AppColors.green0),
  //     dayBackgroundColor: MaterialStateProperty.resolveWith((states) =>
  //         states.contains(MaterialState.selected) ? AppColors.green0 : null));
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    isDense: false,
    floatingLabelStyle: TextStyle(fontSize: 15.sp, color: AppColors.white),
    labelStyle: TextStyle(fontSize: 15.sp, color: AppColors.white),
    contentPadding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 18.sp),
    filled: true,
    hintStyle: TextStyle(fontSize: 20.sp, color: AppColors.black),
    fillColor: AppColors.black32,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.sp),
        borderSide: BorderSide(color: AppColors.black32)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.sp),
        borderSide: BorderSide(color: AppColors.black32)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.black32)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.sp),
        borderSide: BorderSide(color: AppColors.black32)),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    alignLabelWithHint: true,
  );
}
