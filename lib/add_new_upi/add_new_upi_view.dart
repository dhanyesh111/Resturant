import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_bar/app_bars.dart';
import 'package:restaurant/app_buttons/app_buttons.dart';
import 'package:restaurant/assets/icons.dart';
import 'package:restaurant/text_form_fields/text_form_fields.dart';
import 'package:restaurant/validations/validations.dart';

import '../app_colors/app_colors.dart';
import 'add_new_upi_controller.dart';

class AddNewUpiView extends StatelessWidget {
  const AddNewUpiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add New upi"),
      body: Form(
        key: AddNewUpiController.to.addNewUpiFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
          children: [
            Image.asset(AppIcons.upi),
            AppTextFormField(
                suffixIconConstraints:
                    BoxConstraints(maxWidth: 150.sp, maxHeight: 100.sp),
                validator: (value) => Validators.isEmpty(value: value),
                textInputType: TextInputType.number,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black32),
                    borderRadius: BorderRadius.circular(10.sp)),
                controller: AddNewUpiController.to.controllerUpiID,
                header: "UPI ID"),
            SizedBox(
              height: 60.sp,
            ),
            SolidButton(
              onTap: () => {
                if (AddNewUpiController.to.addNewUpiFormKey.currentState
                        ?.validate() ??
                    false)
                  {Get.back()}
              },
              text: "ADD UPI",
            )
          ],
        ),
      ),
    );
  }
}
