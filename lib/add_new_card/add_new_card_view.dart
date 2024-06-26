import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_bar/app_bars.dart';
import 'package:restaurant/app_buttons/app_buttons.dart';
import 'package:restaurant/app_extensions/app_extensions.dart';
import 'package:restaurant/assets/icons.dart';
import 'package:restaurant/text_form_fields/text_form_fields.dart';
import 'package:restaurant/validations/validations.dart';

import '../app_colors/app_colors.dart';
import '../text_input_formatter/text_input_formatter.dart';
import 'add_new_card_controller.dart';

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add New card"),
      body: Form(
        key: AddNewCardController.to.addNewCardFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
          children: [
            GetX<AddNewCardController>(builder: (controller) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 250),
                padding: EdgeInsets.all(10.sp),
                height: 230.sp,
                width: Get.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black32.withOpacity(.4),
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 5),
                      BoxShadow(
                          color: AppColors.black32.withOpacity(.4),
                          offset: Offset(-3, -3),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(20.sp),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: controller.selectedColor.value ??
                            [
                              AppColors.black,
                              AppColors.black32,
                            ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetX<AddNewCardController>(builder: (controller) {
                      return controller.cardType.value == CardType.none
                          ? Container(
                              height: 40.sp,
                              width: 50.sp,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10.sp)),
                            )
                          : Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.sp),
                                  height: 40.sp,
                                  width: 50.sp,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.sp)),
                                  child: Image.asset(
                                    controller.cardType.value == CardType.visa
                                        ? AppIcons.visa
                                        : controller.cardType.value ==
                                                CardType.mastercard
                                            ? AppIcons.masterCard
                                            : "",
                                    width: 50.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.sp,
                                ),
                                Text(
                                  controller.cardType.value == CardType.visa
                                      ? "VISA"
                                      : controller.cardType.value ==
                                              CardType.mastercard
                                          ? "MASTER CARD"
                                          : "",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            );
                    }),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.sp),
                          child: Image.asset(
                            AppIcons.cardChipSilver,
                            width: 60.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card Number",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        GetX<AddNewCardController>(builder: (controller) {
                          return Text(
                            controller.cardNumber.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 22.sp,
                                height: 1,
                                fontWeight: FontWeight.w600),
                          );
                        }),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetX<AddNewCardController>(builder: (controller) {
                          return Text(
                            controller.nameOnCard.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18.sp,
                            ),
                          );
                        }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Valid Thru",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            GetX<AddNewCardController>(builder: (controller) {
                              return Text(
                                "${controller.expiryMonth.value?.changeDateFormat(format: "MMM") ?? "XXX"} /${controller.expiryYear.value?.changeDateFormat(format: "yyy") ?? "XXXX"} ",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              );
                            })
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
            SizedBox(
              height: 30.sp,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
              decoration: BoxDecoration(
                  color: AppColors.black32,
                  borderRadius: BorderRadius.circular(10.sp)),
              height: 80.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: AddNewCardController.to.cardColors
                    .map((colors) => GestureDetector(
                          onTap: () => AddNewCardController
                              .to.selectedColor.value = colors,
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.sp,
                            width: 60.sp,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: colors)),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            AppTextFormField(
                onChanged: (value) =>
                    AddNewCardController.to.nameOnCard.value = value,
                validator: (value) => Validators.isEmpty(value: value),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black32),
                    borderRadius: BorderRadius.circular(10.sp)),
                controller: AddNewCardController.to.controllerNameOnCard,
                header: "Name On Card"),
            SizedBox(
              height: 20.sp,
            ),
            GetX<AddNewCardController>(builder: (controller) {
              return AppTextFormField(
                  suffixIconConstraints:
                      BoxConstraints(maxWidth: 150.sp, maxHeight: 100.sp),
                  suffixIcon: controller.cardType.value == CardType.none
                      ? null
                      : Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 15.sp),
                          padding: EdgeInsets.all(5.sp),
                          height: 40.sp,
                          width: 60.sp,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Image.asset(
                            controller.cardType.value == CardType.visa
                                ? AppIcons.visa
                                : controller.cardType.value ==
                                        CardType.mastercard
                                    ? AppIcons.masterCard
                                    : "",
                            width: 50.sp,
                          ),
                        ),
                  onChanged: (value) {
                    controller.cardNumber.value = value;
                    value.isEmpty
                        ? controller.cardType.value = CardType.none
                        : null;
                    if (value.isNotEmpty) {
                      value[0] == "4"
                          ? controller.cardType.value = CardType.visa
                          : null;
                      value[0] == "2" || value == "5"
                          ? controller.cardType.value = CardType.mastercard
                          : null;
                    }
                  },
                  inputFormatters: [
                    MaskedTextInputFormatter(
                      mask: "XXXX-XXXX-XXXX-XXXX",
                      separator: "-",
                    ),
                  ],
                  maxLength: 19,
                  validator: (value) => Validators.cardNumber(value: value),
                  textInputType: TextInputType.number,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black32),
                      borderRadius: BorderRadius.circular(10.sp)),
                  controller: AddNewCardController.to.controllerCardNumber,
                  header: "Card Number");
            }),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * .43,
                  child: AppDropDownFormField(
                      header: "Month",
                      validator: (value) => Validators.isEmpty(
                            value:
                                value?.changeDateFormat(format: "MMMM") ?? "",
                          ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black32),
                          borderRadius: BorderRadius.circular(10.sp)),
                      onChange: (month) =>
                          AddNewCardController.to.expiryMonth.value = month,
                      value: AddNewCardController.to.expiryMonth.value,
                      itemList: AddNewCardController.to.monthList,
                      label: (month) => month.changeDateFormat(format: "MMMM")),
                ),
                Container(
                  width: Get.width * .43,
                  child: AppDropDownFormField(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.black32),
                          borderRadius: BorderRadius.circular(10.sp)),
                      header: "Year",
                      validator: (value) => Validators.isEmpty(
                            value: value?.changeDateFormat(format: "yyy") ?? "",
                          ),
                      onChange: (year) =>
                          AddNewCardController.to.expiryYear.value = year,
                      value: AddNewCardController.to.expiryYear.value,
                      itemList: AddNewCardController.to.yearList.toList(),
                      label: (year) => year.changeDateFormat(format: "yyy")),
                ),
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            AppTextFormField(
                maxLength: 3,
                inputFormatters: [
                  MaskedTextInputFormatter(
                    mask: "X X X",
                    separator: " ",
                  ),
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) => Validators.cvv(value: value),
                textInputType: TextInputType.number,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black32),
                    borderRadius: BorderRadius.circular(10.sp)),
                controller: AddNewCardController.to.controllerCvv,
                header: "CVV"),
            SizedBox(
              height: 30.sp,
            ),
            SolidButton(
              onTap: () => {
                if (AddNewCardController.to.addNewCardFormKey.currentState
                        ?.validate() ??
                    false)
                  {Get.back()}
              },
              text: "ADD CARD",
            )
          ],
        ),
      ),
    );
  }
}
