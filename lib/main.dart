import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/app_pages/app_pages.dart';
import 'package:restaurant/app_themes/app_themes.dart';

import 'app_routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Restaurant app',
            theme: ThemeData(
                scaffoldBackgroundColor: AppColors.black21,
                useMaterial3: true,
                dividerTheme: DividerThemeData(color: AppColors.black32),
                appBarTheme: AppThemes.appBarTheme,
                inputDecorationTheme: AppThemes.inputDecorationTheme,
                cardTheme: CardTheme(
                    surfaceTintColor: AppColors.black32,
                    color: AppColors.black32)),
            initialRoute: AppRoutes.orderFoodHomePage,
            getPages: AppPages.appPages,
          );
        });
  }
}

final box = GetStorage();
