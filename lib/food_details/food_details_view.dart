import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_buttons/app_buttons.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/app_routes/app_routes.dart';
import 'package:restaurant/circle_with_icon/circle_with_icon.dart';

import '../app_network_image/app_network_image.dart';
import 'food_details_controller.dart';
import 'food_details_model.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Hero(
          tag: FoodDetailsController.to.productImage ?? "",
          child: AppNetworkImage(
            width: Get.width,
            height: 550.sp,
            imageUrl: FoodDetailsController.to.productImage ?? "",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Text(
                FoodDetailsController.to.productName ?? "Plain Dosa",
                style: TextStyle(color: AppColors.white, fontSize: 30.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) => index)
                        .map(((index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 3.sp),
                              child: Icon(
                                Icons.star,
                                color: index <
                                        (FoodDetailsController.to.rating ?? 4)
                                    ? Colors.yellow
                                    : AppColors.white.withOpacity(.5),
                                size: 20.sp,
                              ),
                            )))
                        .toList(),
                  ),
                  SizedBox(
                    width: 20.sp,
                  ),
                  Text(
                    (FoodDetailsController.to.rating ?? 4).toString(),
                    style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          "₹ ${FoodDetailsController.to.productPrice ?? 100} ",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text:
                              "₹ ${FoodDetailsController.to.offerPrice ?? 120}",
                          style: TextStyle(
                              color: AppColors.white.withOpacity(.5),
                              fontSize: 15.sp,
                              decoration: TextDecoration.lineThrough),
                        )
                      ])),
              SizedBox(
                height: 30.sp,
              ),
              Text(
                FoodDetailsController.to.description ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoodInformationContainer(
                    text: "Carbs",
                    value: (FoodDetailsController.to.calories ?? 0).toString(),
                  ),
                  SizedBox(
                    width: 20.sp,
                  ),
                  FoodInformationContainer(
                    text: "gms",
                    value: (FoodDetailsController.to.weight ?? 0).toString(),
                  ),
                  SizedBox(
                    width: 20.sp,
                  ),
                  FoodInformationContainer(
                    text: "fat",
                    value: (FoodDetailsController.to.fat ?? 1.3).toString(),
                  ),
                  SizedBox(
                    width: 20.sp,
                  ),
                  FoodInformationContainer(
                    text: "Protein",
                    value: (FoodDetailsController.to.fat ?? 1.3).toString(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Divider(),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) => SizeTransition(
                              sizeFactor: animation,
                              axis: Axis.horizontal,
                              child: child,
                            ),
                        child: FoodDetailsController.to.itemCount.value == 0
                            ? SizedBox(
                                key: ValueKey("emptySizedBox"),
                              )
                            : Row(
                                children: [
                                  CircleWithIcon(
                                      color: AppColors.black32,
                                      onTap: () => FoodDetailsController
                                          .to
                                          .itemCount
                                          .value = FoodDetailsController
                                              .to.itemCount.value -
                                          1,
                                      child: Icon(
                                        Icons.remove,
                                        color: AppColors.white,
                                      )),
                                  SizedBox(
                                    width: 10.sp,
                                  ),
                                  Container(
                                    height: 40.sp,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.sp),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.black32,
                                        borderRadius:
                                            BorderRadius.circular(5.sp)),
                                    child: GetX<FoodDetailsController>(
                                        builder: (controller) {
                                      return Text(
                                        controller.itemCount.value.toString(),
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.sp),
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                  CircleWithIcon(
                                      color: AppColors.black32,
                                      onTap: () => FoodDetailsController
                                          .to
                                          .itemCount
                                          .value = FoodDetailsController
                                              .to.itemCount.value +
                                          1,
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                      )),
                                ],
                              ));
                  }),
                  Obx(() {
                    return AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) => SizeTransition(
                              sizeFactor: animation,
                              axis: Axis.horizontal,
                              child: child,
                            ),
                        child: FoodDetailsController.to.itemCount.value == 0
                            ? SolidButton(
                                width: 400.sp,
                                text: "Add To Cart",
                                color: AppColors.red183,
                                onTap: () => FoodDetailsController
                                        .to.itemCount.value =
                                    FoodDetailsController.to.itemCount.value +
                                        1,
                                key: ValueKey("addToCart"),
                              )
                            : SolidButton(
                                width: 220.sp,
                                color: AppColors.red183,
                                text: "Move To Cart",
                                onTap: () => Get.toNamed(AppRoutes.cart),
                                key: ValueKey("moveToCart"),
                              ));
                  }),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                width: Get.width,
                child: Wrap(
                  spacing: 15.sp,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 5.sp,
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.start,
                  children: FoodDetailsController.to.ingredients
                      .map((ingredient) => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.lens,
                                color: AppColors.white,
                                size: 10.sp,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Text(
                                ingredient,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Divider(),
              SizedBox(
                height: 10.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms & Conditions od Storage",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Text(
                    "Keep foods 4°C (39°F) or colder, the safe temperature for refrigerated storage. Keep these factors in mind when storing fresh meats, poultry, and produce: All carcass meats should be unwrapped and hung so that air can circulate around them. They should be stored at 1°C to 3°C (34°C to 37°F) in a walk-in refrigerator.",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Divider(),
              SizedBox(
                height: 30.sp,
              ),
              UserReviews()
            ],
          ),
        ),
      ],
    ));
  }
}

class UserReviews extends StatelessWidget {
  const UserReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: FoodDetailsController.to.reviews
              .map((review) => UserReviewListingItemContainer(review: review))
              .toList(),
        )
      ],
    );
  }
}

class UserReviewListingItemContainer extends StatelessWidget {
  ReviewModel review;

  UserReviewListingItemContainer({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.sp),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          color: AppColors.black32, borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(
            imageUrl: review.userImage,
            height: 70.sp,
            width: 70.sp,
            radius: 70.sp,
          ),
          SizedBox(width: 20.sp),
          Container(
            width: 290.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.userName,
                  style: TextStyle(color: AppColors.white, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Text(
                  review.review,
                  style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) => index)
                      .map(((index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.sp),
                            child: Icon(
                              Icons.star,
                              color:
                                  index < (FoodDetailsController.to.rating ?? 4)
                                      ? Colors.yellow
                                      : AppColors.white.withOpacity(.5),
                              size: 15.sp,
                            ),
                          )))
                      .toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FoodInformationContainer extends StatelessWidget {
  RxBool isForward = true.obs;
  String text;
  String value;

  FoodInformationContainer({
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          isForward.value = !isForward.value;
        },
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
            child: isForward.value
                ? Container(
                    height: 60.sp,
                    width: 60.sp,
                    key: ValueKey("isForward"),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.black32,
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                            color: AppColors.white.withOpacity(.8),
                            fontSize: 13.sp),
                      ),
                    ),
                  )
                : Container(
                    height: 70.sp,
                    width: 60.sp,
                    key: ValueKey("isNotForward"),
                    decoration: BoxDecoration(
                        color: AppColors.red183,
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          style: TextStyle(
                              color: AppColors.white.withOpacity(.8),
                              fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                              color: AppColors.white.withOpacity(.8),
                              fontSize: 13.sp),
                        )
                      ],
                    ),
                  )),
      );
    });
  }
}
