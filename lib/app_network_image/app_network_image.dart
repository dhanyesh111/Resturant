import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_colors/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  final bool? isProfile;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.radius,
    this.borderRadius,
    this.fit,
    this.isProfile,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        // "https://images.unsplash.com/photo-1708616748538-bdd66d6a9e25?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        errorWidget:
            (BuildContext context, String exception, Object stackTrace) {
          return (isProfile ?? false)
              ? Container(
                  padding: EdgeInsets.all(7.sp),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    // AppIcons.user,
                    "",
                    color: AppColors.white,
                    height: (height ?? 50.sp) - 14,
                    width: (width ?? 50.sp) - 14,
                  ),
                )
              : Icon(
                  Icons.broken_image_rounded,
                  color: AppColors.black,
                );
        },
        progressIndicatorBuilder: (context, url, loadingProgress) {
          return CircularProgressIndicator(
            color: AppColors.white,
            value: loadingProgress.totalSize != 0
                ? loadingProgress.downloaded / (loadingProgress.totalSize ?? 1)
                : null,
          );
        },

        height: height,
        fit: fit ?? BoxFit.fill,
        width: width ?? 50.sp,
      ),
    );
  }
}
