import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_colors/app_colors.dart';
import '../circle_with_icon/circle_with_icon.dart';
import '../custom_animated_switcher.dart';

class SolidButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final bool? isLoading;
  final Color? color;
  final Color? textColor;
  final void Function()? onTap;

  const SolidButton({
    super.key,
    this.text,
    this.height,
    this.child,
    this.fontSize,
    this.width,
    this.radius,
    this.color,
    this.textColor,
    this.onTap,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.all(5.sp),
              height: (isLoading ?? false) ? 60.sp : height ?? 60.sp,
              width: (isLoading ?? false) ? 60.sp : width ?? 380.sp,
              decoration: BoxDecoration(
                color: color ?? AppColors.black32,
                borderRadius: BorderRadius.circular(radius ?? 10.sp),
              ),
              child: Center(
                child: isLoading == true
                    ? CircularProgressIndicator(
                        color: AppColors.white,
                      )
                    : child ??
                        Text(
                          text ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: fontSize ?? 20.sp,
                              color: textColor ?? AppColors.white),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  RxInt itemCount;

  AddToCartButton({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() {
          return CircleWithIcon(
            color: itemCount.value == 0 ? AppColors.black32 : AppColors.red183,
            child: CustomAnimatedIcon(
              value: itemCount.value == 1,
              firstChild: Icon(Icons.add,
                  size: 25.sp,
                  color: AppColors.white,
                  key: const ValueKey('icon1')),
              secondChild: Icon(
                Icons.remove,
                size: 25.sp,
                color: AppColors.white,
                key: const ValueKey('icon2'),
              ),
              onTap: () {
                if (itemCount.value == 0) {
                  itemCount.value = itemCount.value + 1;
                } else {
                  itemCount.value = itemCount.value - 1;
                }
              },
            ),
          );
        }),
        Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (child, animation) {
              return SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor:
                      Tween<double>(begin: .0, end: 1).animate(animation),
                  child: child);
            },
            child: itemCount.value == 0
                ? const SizedBox()
                : Row(
                    children: [
                      SizedBox(
                        width: 15.sp,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.sp, horizontal: 30.sp),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.red183, width: 2.sp),
                            borderRadius: BorderRadius.circular(7.sp)),
                        child: Obx(() {
                          return Text(
                            textAlign: TextAlign.center,
                            itemCount.toString(),
                            style: TextStyle(
                                fontSize: 18.sp, color: AppColors.red183),
                          );
                        }),
                      ),
                      SizedBox(
                        width: 15.sp,
                      ),
                      GestureDetector(
                        onTap: () => itemCount.value = itemCount.value + 1,
                        child: CircleWithIcon(
                          color: AppColors.red183,
                          child: Icon(Icons.add,
                              size: 25.sp,
                              color: AppColors.white,
                              key: const ValueKey('icon1')),
                        ),
                      )
                    ],
                  ),
          );
        }),
      ],
    );
  }
}

class SliderButton extends StatelessWidget {
  RxDouble dx = 5.0.obs;
  double? height;
  double? width;
  double? padding;
  double? radius;
  double? buttonWidth;
  List<Color>? sliderColor;
  void Function() onTap;
  Color? buttonColor;
  double? decisionPoint;
  Widget? sliderChild;
  SliderButton({
    super.key,
    required this.height,
    required this.width,
    this.radius,
    required this.onTap,
    this.padding,
    this.buttonColor,
    this.sliderColor,
    this.decisionPoint,
    this.sliderChild,
    this.buttonWidth,
  });
  @override
  Widget build(BuildContext context) {
    double startPoint = 0;
    double endPoint = ((width ?? 300.sp) - (padding ?? 5.sp) + 1) +
        (buttonWidth ?? 60.sp) -
        171;
    return Stack(
      children: [
        Container(
          height: height ?? 70.sp,
          width: width ?? 300.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: sliderColor ?? [Colors.green, Colors.greenAccent],
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft),
              borderRadius: BorderRadius.circular(radius ?? height ?? 70.sp)),
          child: sliderChild,
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            print(details.localPosition.dx);
            if (details.localPosition.dx > startPoint &&
                details.localPosition.dx < endPoint) {
              dx.value = details.localPosition.dx;
              if (details.localPosition.dx > (decisionPoint ?? 200.sp)) {
                print("s");
                onTap();
                dx.value = endPoint;
              }
            }
          },
          onHorizontalDragCancel: () {
            dx.value = 5;
          },
          onHorizontalDragEnd: (details) {
            if (details.localPosition.dx > startPoint &&
                details.localPosition.dx < endPoint) {
              if (details.localPosition.dx < (decisionPoint ?? 200.sp)) {
                dx.value = 5;
              }
            }
          },
          child: Row(
            children: [
              Obx(() {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: dx.value,
                    top: 5.sp,
                  ),
                  height: 60.sp,
                  width: buttonWidth ?? 60.sp,
                  decoration: BoxDecoration(
                      color: buttonColor ?? AppColors.red183,
                      borderRadius: BorderRadius.circular(radius ?? 70.sp)),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.black,
                  ),
                );
              }),
            ],
          ),
        )
      ],
    );
  }
}
