import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_bar/app_bars.dart';
import 'package:restaurant/app_buttons/app_buttons.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/app_network_image/app_network_image.dart';
import 'package:restaurant/app_routes/app_routes.dart';
import 'package:restaurant/cart/cart_controller.dart';
import 'package:restaurant/flip_card/flip_card.dart';

import '../assets/icons.dart';
import '../circle_with_icon/circle_with_icon.dart';
import 'cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Cart",
        ),
        body: GetX<CartController>(builder: (controller) {
          return controller.isLoading.value
              ? SizedBox()
              : ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  children: [
                    Products(),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Coupons(),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Tips(),
                    SizedBox(
                      height: 20.sp,
                    ),
                    DeliveryInstructions(),
                    SizedBox(
                      height: 20.sp,
                    ),
                    SubTotal(),
                    SizedBox(
                      height: 30.sp,
                    ),
                    SolidButton(
                      color: AppColors.black32,
                      text: "ORDER NOW",
                      onTap: () => Get.bottomSheet(OrderNowBottomSheet(),
                          isScrollControlled: true),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                  ],
                );
        }));
  }
}

class OrderNowBottomSheet extends StatelessWidget {
  const OrderNowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
          color: AppColors.black32,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.sp),
            topRight: Radius.circular(30.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Finish Order",
            style: TextStyle(color: AppColors.white, fontSize: 20.sp),
          ),
          SizedBox(
            height: 20.sp,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.paymentMethods),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 10.sp),
                      decoration: BoxDecoration(
                          color: AppColors.black21,
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: Image.asset(
                        AppIcons.visa,
                        width: 50.sp,
                      ),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    Text(
                      "XXX-XXXX-XXXX-${CartController.to.cardNumber}",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Change",
                      style: TextStyle(color: AppColors.white),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,
                        size: 18.sp, color: AppColors.white),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          SliderButton(
            height: 70.sp,
            width: Get.width,
            sliderChild: Text(
              "Slide to pay",
              style: TextStyle(color: AppColors.white, fontSize: 20.sp),
            ),
            onTap: () {},
            buttonColor: AppColors.white,
            sliderColor: [
              AppColors.green23,
              AppColors.green42,
            ],
          )
        ],
      ),
    );
  }
}

class Tips extends StatelessWidget {
  const Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tips",
          style: TextStyle(color: AppColors.white, fontSize: 20.sp),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              color: AppColors.black32,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Column(
            children: [
              Text(
                "Working in this weather is tough, but your partner will deliver. Your tip, big or small , helps them keep going",
                style: TextStyle(color: AppColors.white, fontSize: 16.sp),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                width: 250.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: CartController.to.tipOptions
                      .map((tip) => TipListingContainer(tip: tip))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TipListingContainer extends StatelessWidget {
  int tip;
  TipListingContainer({required this.tip});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CartController.to.selectedTipOptions.value = tip,
      child: GetX<CartController>(builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              color: controller.selectedTipOptions.value == tip
                  ? AppColors.red183
                  : AppColors.black21,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Text(
            "₹ ${tip.toString()}",
            style: TextStyle(color: AppColors.white, fontSize: 18.sp),
          ),
        );
      }),
    );
  }
}

class DeliveryInstructions extends StatelessWidget {
  const DeliveryInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivery Instructions",
          style: TextStyle(color: AppColors.white, fontSize: 20.sp),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          height: 113.sp,
          width: Get.width,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: CartController.to.deliveryInstruction
                .map((instruction) => FlipCard(
                    firstChild: DeliveryInstructionsListingItemFrontSide(
                        instruction: instruction),
                    secondChild: DeliveryInstructionsListingItemBackSide(
                        instruction: instruction)))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class DeliveryInstructionsListingItemFrontSide extends StatelessWidget {
  DeliveryInstructionModel instruction;
  DeliveryInstructionsListingItemFrontSide({required this.instruction});
  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(builder: (controller) {
      return GestureDetector(
        onTap: () =>
            instruction.isSelected.value = !instruction.isSelected.value,
        child: AnimatedContainer(
          width: 125.sp,
          margin: EdgeInsets.only(right: 20.sp),
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              color: instruction.isSelected.value
                  ? AppColors.red183
                  : AppColors.black32,
              borderRadius: BorderRadius.circular(10.sp)),
          duration: Duration(milliseconds: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                instruction.icon,
                color: AppColors.white,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                instruction.text,
                style: TextStyle(fontSize: 16.sp, color: AppColors.white),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class DeliveryInstructionsListingItemBackSide extends StatelessWidget {
  DeliveryInstructionModel instruction;
  DeliveryInstructionsListingItemBackSide({required this.instruction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.sp,
      margin: EdgeInsets.only(right: 20.sp),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          color: AppColors.red183, borderRadius: BorderRadius.circular(10.sp)),
      child: Text(
        instruction.description,
        style: TextStyle(color: AppColors.white, fontSize: 16.sp),
      ),
    );
  }
}

class Coupons extends StatelessWidget {
  const Coupons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Offer and Benefits",
          style: TextStyle(color: AppColors.white, fontSize: 20.sp),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              color: AppColors.black32,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppIcons.gift,
                    height: 40.sp,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    "Coupons",
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          color: AppColors.black32, borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.sp,
          ),
          GetX<CartController>(builder: (controller) {
            return Column(
              children: CartController.to.productList
                  .map(
                    (product) => ProductListingItem(product: product),
                  )
                  .toList(),
            );
          }),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                  child: Icon(
                    Icons.location_on,
                    color: AppColors.grey132,
                    size: 20.sp,
                  ),
                ),
                TextSpan(
                    text: " My house , California calicut ",
                    style:
                        TextStyle(color: AppColors.grey132, fontSize: 18.sp)),
              ])),
              Icon(
                Icons.edit,
                color: AppColors.grey132,
                size: 20.sp,
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rate",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "₹ 100",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SubTotal extends StatelessWidget {
  const SubTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          color: AppColors.black32, borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "₹ 100",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 20.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: CartController.to.paymentDetails
                .map((paymentDetail) =>
                    SubTotalListingItem(paymentDetail: paymentDetail))
                .toList(),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grand Total",
                style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "₹ 180",
                style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SubTotalListingItem extends StatelessWidget {
  PaymentDetails paymentDetail;

  SubTotalListingItem({required this.paymentDetail});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.sp),
      width: 350.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            paymentDetail.text,
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "₹ ${paymentDetail.value}",
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class ProductListingItem extends StatelessWidget {
  CartProductModel product;
  ProductListingItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppNetworkImage(
          imageUrl: product.image,
          height: 100.sp,
          width: 120.sp,
          radius: 10.sp,
        ),
        SizedBox(
          width: 15.sp,
        ),
        Container(
          width: 240.sp,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 18.sp, color: AppColors.white),
                  ),
                  Text(
                    "Price : ₹ ${product.price}",
                    style: TextStyle(fontSize: 18.sp, color: AppColors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 25.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "QTY: ${product.itemCount.value.toString()}",
                    style: TextStyle(fontSize: 18.sp, color: AppColors.white),
                  ),
                  Row(
                    children: [
                      CircleWithIcon(
                          color: AppColors.red183,
                          onTap: () {
                            if (product.itemCount.value == 1) {
                              CartController.to.productList.remove(product);
                            } else {
                              product.itemCount.value =
                                  product.itemCount.value - 1;
                            }
                          },
                          child: Icon(
                            Icons.remove,
                            size: 18.sp,
                            color: AppColors.white,
                          )),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Container(
                        height: 25.sp,
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.red183,
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: GetX<CartController>(builder: (controller) {
                          return Text(
                            product.itemCount.value.toString(),
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          );
                        }),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      CircleWithIcon(
                          color: AppColors.red183,
                          onTap: () => product.itemCount.value =
                              product.itemCount.value + 1,
                          child: Icon(
                            Icons.add,
                            size: 18.sp,
                            color: AppColors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
