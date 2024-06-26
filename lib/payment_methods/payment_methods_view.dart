import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_bar/app_bars.dart';
import 'package:restaurant/app_buttons/app_buttons.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/app_routes/app_routes.dart';
import 'package:restaurant/payment_methods/payment_methods_controller.dart';
import 'package:restaurant/payment_methods/payment_methods_model.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Payment  Options",
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          children: [
            PreferredPayment(),
            SizedBox(
              height: 30.sp,
            ),
            UpiAddPayment(),
            SizedBox(
              height: 30.sp,
            ),
            CreditAndDebitCard(),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ));
  }
}

class PreferredPayment extends StatelessWidget {
  const PreferredPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Preferred Payment",
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          decoration: BoxDecoration(
              color: AppColors.black32,
              borderRadius: BorderRadius.circular(20.sp)),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: PaymentMethodsController.to.preferredPayment.length,
            itemBuilder: (BuildContext context, int index) =>
                PaymentMethodListingItem(
              payment: PaymentMethodsController.to.preferredPayment[index],
            ),
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: AppColors.grey132,
            ),
          ),
        )
      ],
    );
  }
}

class CreditAndDebitCard extends StatelessWidget {
  const CreditAndDebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Credit And Debit Card",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.addNewCard),
              child: Text(
                "Add +",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.red183,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          decoration: BoxDecoration(
              color: AppColors.black32,
              borderRadius: BorderRadius.circular(20.sp)),
          child: GetX<PaymentMethodsController>(builder: (controller) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.viewAllCreditAndDebitCard.value
                  ? controller.upiApp.length
                  : 3,
              itemBuilder: (BuildContext context, int index) =>
                  PaymentMethodListingItem(
                payment: PaymentMethodsController.to.creditAndDebitCard[index],
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: AppColors.grey132,
              ),
            );
          }),
        ),
        PaymentMethodsController.to.creditAndDebitCard.length > 3
            ? GetX<PaymentMethodsController>(builder: (controller) {
                return GestureDetector(
                    onTap: () => controller.viewAllCreditAndDebitCard.value =
                        !controller.viewAllCreditAndDebitCard.value,
                    child: Text(controller.viewAllCreditAndDebitCard.value
                        ? "View All"
                        : "View Less"));
              })
            : SizedBox()
      ],
    );
  }
}

class UpiAddPayment extends StatelessWidget {
  const UpiAddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pay by any upi app",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.addNewUpi),
              child: Text(
                "Add +",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.red183,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          decoration: BoxDecoration(
              color: AppColors.black32,
              borderRadius: BorderRadius.circular(20.sp)),
          child: GetX<PaymentMethodsController>(builder: (controller) {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  controller.viewAllUpi.value ? controller.upiApp.length : 3,
              itemBuilder: (BuildContext context, int index) =>
                  PaymentMethodListingItem(
                payment: controller.upiApp[index],
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: AppColors.grey132,
              ),
            );
          }),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PaymentMethodsController.to.upiApp.length > 3
                ? GetX<PaymentMethodsController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () => controller.viewAllUpi.value =
                          !controller.viewAllUpi.value,
                      child: SolidButton(
                          height: 35.sp,
                          color: AppColors.red183,
                          width: 100.sp,
                          fontSize: 15.sp,
                          text: controller.viewAllUpi.value
                              ? "View Less"
                              : "View All"),
                    );
                  })
                : SizedBox(),
          ],
        )
      ],
    );
  }
}

class PaymentMethodListingItem extends StatelessWidget {
  PaymentMethodsModel payment;
  PaymentMethodListingItem({required this.payment});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PaymentMethodsController.to.selectedPayment.value = payment,
      child: Container(
        color: AppColors.black32,
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.sp, vertical: 2.sp),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.sp)),
                      child: Image.asset(
                        payment.icon,
                        width: 40.sp,
                        height: 40.sp,
                      ),
                    ),
                    SizedBox(
                      width: 30.sp,
                    ),
                    Container(
                      width: 250.sp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            payment.name,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          payment.subText.isEmpty
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    Text(
                                      payment.subText,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey132)),
                  child: GetX<PaymentMethodsController>(builder: (controller) {
                    return Container(
                      height: 12.sp,
                      width: 12.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.selectedPayment.value == payment
                            ? AppColors.green23
                            : AppColors.black32,
                      ),
                    );
                  }),
                )
              ],
            ),
            GetX<PaymentMethodsController>(builder: (controller) {
              return controller.selectedPayment.value == payment
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20.sp,
                        ),
                        SolidButton(
                          height: 50.sp,
                          width: 300.sp,
                          color: AppColors.green42,
                          text: "Pay with ${payment.name}",
                        ),
                      ],
                    )
                  : SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
