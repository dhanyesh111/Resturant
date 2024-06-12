import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app_network_image/app_network_image.dart';

import '../app_colors/app_colors.dart';

// class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final List<Widget>? actions;
//   final double? height;
//   final PreferredSizeWidget? bottom;
//   const HomePageAppBar({
//     Key? key,
//     this.title,
//     this.actions,
//     this.height,
//     this.bottom,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: AppColors.brown88,
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.light,
//       ),
//       elevation: 0,
//       backgroundColor: AppColors.brown88,
//       automaticallyImplyLeading: true,
//       bottom: bottom,
//       leading: Container(
//           padding: EdgeInsets.all(15.sp),
//           child: SvgPicture.asset(AppIcons.menu)),
//       title: Text("AlSarhan",
//           style: TextStyle(
//               fontSize: 30.sp,
//               color: AppColors.white,
//               fontWeight: FontWeight.w700)),
//       actions: (actions ?? [])
//           .map((action) => Container(
//                 padding: EdgeInsets.all(15.sp),
//                 child: action,
//               ))
//           .toList(),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(height ?? 120.sp);
// }
//
// class AllCategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final List<Widget>? actions;
//   final double? height;
//   final Widget? leading;
//   final PreferredSizeWidget? bottom;
//   const AllCategoryAppBar({
//     Key? key,
//     this.title,
//     this.actions,
//     this.leading,
//     this.height,
//     this.bottom,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: AppColors.white,
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.dark,
//       ),
//       elevation: 0,
//       backgroundColor: AppColors.white,
//       automaticallyImplyLeading: true,
//       bottom: bottom,
//       leading: leading,
//       title: Text("All Category",
//           style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
//       actions: (actions ?? [])
//           .map((action) => Container(
//                 padding: EdgeInsets.all(12.sp),
//                 child: action,
//               ))
//           .toList(),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(height ?? 70.sp);
// }
//
// class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final List<Widget>? actions;
//   final double? height;
//   final Widget? leading;
//   final PreferredSizeWidget? bottom;
//   const CartAppBar({
//     Key? key,
//     this.title,
//     this.actions,
//     this.leading,
//     this.height,
//     this.bottom,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: AppColors.white,
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.dark,
//       ),
//       elevation: 0,
//       backgroundColor: AppColors.white,
//       automaticallyImplyLeading: true,
//       bottom: bottom,
//       leading: leading,
//       title: Text("Cart",
//           style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
//       actions: (actions ?? [])
//           .map((action) => Container(
//                 padding: EdgeInsets.all(12.sp),
//                 child: action,
//               ))
//           .toList(),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(height ?? 70.sp);
// }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double? height;
  final PreferredSizeWidget? bottom;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.height,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.black21,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: AppColors.black21,
      automaticallyImplyLeading: true,
      bottom: bottom,
      title: Text(title.toUpperCase(),
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700)),
      actions: (actions ?? [])
          .map((action) => Container(
                padding: EdgeInsets.all(15.sp),
                child: action,
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70.sp);
}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? deliveryLocation;
  final List<Widget>? actions;
  final double? height;
  final PreferredSizeWidget? bottom;
  const HomePageAppBar({
    Key? key,
    this.deliveryLocation,
    this.actions,
    this.height,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black21,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light),
      elevation: 0,
      backgroundColor: AppColors.black21,
      automaticallyImplyLeading: true,
      bottom: bottom,
      leadingWidth: 75.sp,
      leading: Container(
        padding: EdgeInsets.only(left: 20.sp, top: 10.sp),
        child: AppNetworkImage(
          height: 50.sp,
          width: 50.sp,
          radius: 50.sp,
          fit: BoxFit.cover,
          imageUrl:
              "https://ca-times.brightspotcdn.com/dims4/default/390f45f/2147483647/strip/true/crop/2048x1365+0+0/resize/1200x800!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F67%2F2c%2Fd791ad0fddf0f8d62174c974c5b2%2Fla-et-mg-kristen-stewart-poem-marie-claire-reg-001",
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver To,",
              style: TextStyle(fontSize: 14.sp, color: AppColors.grey132)),
          Text(deliveryLocation ?? '',
              style: TextStyle(fontSize: 18.sp, color: AppColors.white)),
        ],
      ),
      actions: (actions ?? [])
          .map((action) => Container(
                padding: EdgeInsets.all(15.sp),
                child: action,
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70.sp);
}
