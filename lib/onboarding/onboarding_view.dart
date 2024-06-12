import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/app_network_image/app_network_image.dart';
import 'package:restaurant/onboarding/onboarding_controller.dart';

import '../parallax_delegate/parallax_delegate.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 80.sp),
      children: [
        SizedBox(
          height: 630.sp,
          width: Get.width,
          child: PageView(
              padEnds: true,
              onPageChanged: (int index) =>
                  OnboardingController.to.currentIndex.value = index,
              children: OnboardingController.to.images
                  .map(
                    (onboardingPageItem) => OnboardingPageItem(
                        onboardingPageItem: onboardingPageItem),
                  )
                  .toList()),
        ),
        SizedBox(
          height: 20.sp,
        ),
        const DotIndicator(),
        SizedBox(
          height: 30.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetX<OnboardingController>(builder: (controller) {
              return controller.currentIndex.value != 2
                  ? Text(
                      "Skip Introduction",
                      style: TextStyle(fontSize: 15.sp, color: AppColors.white),
                    )
                  : const SizedBox();
            }),
            const NextButton()
          ],
        )
      ],
    ));
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<OnboardingController>(builder: (controller) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: controller.currentIndex.value != 2 ? 60 : 400.sp,
        height: 60.sp,
        decoration: BoxDecoration(
            color: AppColors.black32,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.currentIndex.value == 2
                ? Text("Get Started  ",
                    style: TextStyle(fontSize: 14.sp, color: AppColors.white))
                : Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.white,
                  ),
          ],
        ),
      );
    });
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 8.sp),
          decoration: BoxDecoration(
              color: AppColors.black32,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => index)
                .toList()
                .map((e) => GetX<OnboardingController>(builder: (controller) {
                      return AnimatedContainer(
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        duration: const Duration(milliseconds: 250),
                        width:
                            controller.currentIndex.value == e ? 30.sp : 7.sp,
                        height: 7.sp,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.sp)),
                      );
                    }))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class OnboardingPageItem extends StatelessWidget {
  final OnBoardingItemModel onboardingPageItem;
  const OnboardingPageItem({super.key, required this.onboardingPageItem});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageStack(imageList: onboardingPageItem.images),
        SizedBox(
          height: 140.sp,
        ),
        Text(
          onboardingPageItem.header,
          style: TextStyle(fontSize: 30.sp, color: AppColors.white),
        ),
        Text(
          onboardingPageItem.body,
          style: TextStyle(fontSize: 14.sp, color: AppColors.grey132),
        ),
      ],
    );
  }
}

class ImageStack extends StatelessWidget {
  final List<String> imageList;
  const ImageStack({super.key, required this.imageList});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.sp,
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          top: 25.sp,
          right: 0.sp,
          child: Transform.rotate(
            angle: .2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.sp),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black32.withOpacity(.1),
                        offset: (const Offset(2, 2)),
                        spreadRadius: 2,
                        blurRadius: 6),
                    BoxShadow(
                        color: AppColors.black32.withOpacity(1),
                        offset: (const Offset(-2, -2)),
                        spreadRadius: 2,
                        blurRadius: 6),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.sp),
                child: AppNetworkImage(
                  imageUrl: imageList.first,
                  height: 230.sp,
                  width: 230.sp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20.sp,
          left: 0,
          child: Transform.rotate(
            angle: -.2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.sp),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black32.withOpacity(.1),
                        offset: (const Offset(2, 2)),
                        spreadRadius: 2,
                        blurRadius: 6),
                    BoxShadow(
                        color: AppColors.black32.withOpacity(1),
                        offset: (const Offset(-2, -2)),
                        spreadRadius: 2,
                        blurRadius: 6),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.sp),
                child: AppNetworkImage(
                  imageUrl: imageList.last,
                  height: 230.sp,
                  width: 230.sp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class ParallaxView extends StatelessWidget {
  final Widget child;
  final bool? isHorizontal;
  const ParallaxView({super.key, required this.child, this.isHorizontal});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      height: Get.height * .8,
      width: Get.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Flow(
          delegate: (isHorizontal ?? false)
              ? ParallaxFlowDelegateHorizontal(
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                )
              : ParallaxFlowDelegateVertical(
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                ),
          children: [child],
        ),
      ),
    );
  }
}
