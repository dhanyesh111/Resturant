import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../app_colors/app_colors.dart';
import '../assets/icons.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final String header;
  final String? hint;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? obscureText;
  final String? placeHolder;
  String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  AppTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      this.onChanged,
      this.maxLines,
      this.obscureText,
      this.maxLength,
      this.minLines,
      this.errorText,
      this.placeHolder,
      this.hint,
      required this.header,
      this.textInputType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(fontSize: 20.sp, color: AppColors.black),
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      smartDashesType: SmartDashesType.enabled,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: "",
        labelText: header,
        hintText: hint,
        errorText: (errorText ?? "").isEmpty ? null : errorText,
      ),
    );
  }
}

class AppTextFormFieldPassword extends StatelessWidget {
  final String header;
  final String? hint;
  final int? maxLInes;
  final int? minLines;
  final int? maxLength;
  final String? placeHolder;

  String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  AppTextFormFieldPassword(
      {super.key,
      required this.controller,
      this.validator,
      this.maxLInes,
      this.maxLength,
      this.minLines,
      this.errorText,
      this.placeHolder,
      this.hint,
      required this.header,
      this.textInputType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    RxBool obscureText = true.obs;
    return Obx(() {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        onChanged: (value) {
          errorText = "";
          value.replaceAll(" ", "");
        },
        style: TextStyle(fontSize: 20.sp, color: AppColors.black),
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        smartDashesType: SmartDashesType.enabled,
        maxLines: maxLInes ?? 1,
        minLines: minLines ?? 1,
        obscureText: obscureText.value,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: "",
          labelText: header,
          hintText: hint,
          alignLabelWithHint: true,
          errorText: (errorText ?? "").isEmpty ? null : errorText,
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    obscureText.value = !obscureText.value;
                  },
                  child: obscureText.value
                      ? SvgPicture.asset(
                          AppIcons.eyeClosed,
                          height: 20.sp,
                        )
                      : SvgPicture.asset(
                          AppIcons.eyeOpen,
                          height: 20.sp,
                        )),
            ],
          ),
        ),
      );
    });
  }
}

class AppDatePickerFormField extends StatelessWidget {
  final String header;
  final String? placeHolder;
  final String? label;
  final bool? readOnly;
  final void Function()? readOnlyCallBack;
  final DateTime? initialDate;
  final Widget? icon;
  final DateTime? lastDate;
  final DateTime? startDate;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AppDatePickerFormField(
      {super.key,
      required this.header,
      this.readOnly,
      this.readOnlyCallBack,
      this.placeHolder,
      this.icon,
      this.initialDate,
      this.lastDate,
      this.startDate,
      required this.controller,
      this.label,
      this.validator});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("d / MMM / yyyy");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (readOnly ?? false)
              ? readOnlyCallBack
              : () async {
                  DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: startDate ?? DateTime(1998),
                      lastDate: lastDate ?? DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      helpText: label,
                      initialDate: initialDate ?? startDate ?? DateTime.now());

                  if (date != null) {
                    controller.text = dateFormat.format(date);
                  }
                },
          child: IgnorePointer(
            child: TextFormField(
              style: TextStyle(color: AppColors.black, fontSize: 20.sp),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              readOnly: readOnly ?? false,
              validator: validator,
              decoration: InputDecoration(
                isDense: false,
                labelText: header,
                floatingLabelStyle:
                    TextStyle(fontSize: 20.sp, color: AppColors.black),
                labelStyle: TextStyle(fontSize: 20.sp, color: AppColors.black),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 25.sp,
                  maxWidth: 65.sp,
                ),
                // suffixIcon: Container(
                //   padding: EdgeInsets.only(right: 13.sp),
                //   child: icon ??
                //       SvgPicture.asset(
                //         AppIcons.calender,
                //       ),
                // ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppTextFormFieldTime extends StatelessWidget {
  final String placeHolder;
  final String? label;
  final TextEditingController controller;

  const AppTextFormFieldTime({
    super.key,
    required this.placeHolder,
    required this.controller,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showTimePicker(
                initialEntryMode: TimePickerEntryMode.input,
                builder: (context, child) => Theme(
                      data: ThemeData(
                        colorScheme: ColorScheme.light(
                          primary: AppColors.black,
                        ),
                      ),
                      child: child!,
                    ),
                context: context,
                initialTime: TimeOfDay.now())
            .then((time) {
          if (time != null) {
            controller.text = time.format(context);
          }
        });
      },
      child: IgnorePointer(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          // validator: (value) =>
          //     Validators.isEmpty(value ?? "", "This field is required"),
          decoration: InputDecoration(
            suffixIcon: Container(
              margin: EdgeInsets.only(right: 05.sp),
              child: Icon(
                Icons.access_time,
                size: 18.sp,
              ),
            ),
            suffixIconConstraints:
                BoxConstraints(maxHeight: 50.sp, maxWidth: 50.sp),
          ),
        ),
      ),
    );
  }
}

class AppDropDownFormField<T> extends StatelessWidget {
  final String header;
  final String? placeHolder;
  final String? errorText;
  final bool? validationNeeded;
  final double? width;
  final bool? readOnly;
  final String? Function(T) label;
  final T? value;
  final String? Function(T?)? validator;
  final void Function(T?)? onChange;
  final List<T> itemList;

  const AppDropDownFormField(
      {super.key,
      required this.header,
      required this.onChange,
      required this.value,
      required this.itemList,
      this.errorText,
      this.width,
      this.readOnly,
      this.placeHolder,
      required this.label,
      this.validationNeeded,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        iconSize: 0,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        itemHeight: null,
        isExpanded: true,
        style: TextStyle(fontSize: 20.sp, color: AppColors.black),
        decoration: InputDecoration(
          counterText: "",
          labelText: header,
        ),
        items: itemList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    label(e) ?? "",
                    style: TextStyle(fontSize: 20.sp, color: AppColors.black),
                  ),
                ))
            .toList(),
        value: value,
        onChanged: onChange);
  }
}
