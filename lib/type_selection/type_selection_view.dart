import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app_colors/app_colors.dart';
import 'package:restaurant/type_selection/type_selection_controller.dart';
import 'package:restaurant/type_selection/type_selection_model.dart';

class TypeSelectionScreen extends StatelessWidget {
  const TypeSelectionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Available services".toUpperCase()),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 30.sp),
          children: [
            Text(
              "Please select one from the below listed services",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 20.sp,
            ),
            GridView(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 30.sp,
                  crossAxisSpacing: 30.sp,
                  childAspectRatio: 145.sp / 165.sp,
                  crossAxisCount: 2),
              children: TypeSelectionController.to.availableOptions
                  .map((option) => TypeSelectionContainer(
                        option: option,
                      ))
                  .toList(),
            ),
            const Divider(),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Services Provided".toUpperCase(),
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: TypeSelectionController.to.otherServices
                  .map((serviceGroup) =>
                      OtherServicesListingItem(serviceGroup: serviceGroup))
                  .toList(),
            )
          ],
        ));
  }
}

class OtherServicesListingItem extends StatelessWidget {
  final OtherServicesItemModel serviceGroup;
  const OtherServicesListingItem({super.key, required this.serviceGroup});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.only(bottom: 15.sp),
      decoration: BoxDecoration(
          color: AppColors.black32, borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceGroup.heading,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Wrap(
            runSpacing: 15.sp,
            spacing: 15.sp,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            children: serviceGroup.services
                .map((service) => ServiceItem(service: service))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String service;
  const ServiceItem({super.key, required this.service});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            gradient: LinearGradient(
                colors: [AppColors.blue, AppColors.blue.withOpacity(.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
        child: Text(
          service,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ));
  }
}

class TypeSelectionContainer extends StatelessWidget {
  final TypeSelectionItemModel option;
  const TypeSelectionContainer({super.key, required this.option});
  @override
  Widget build(BuildContext context) {
    final Color backGroundColor = Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
    return Column(
      children: [
        Container(
          width: 140.sp,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp),
              ),
              gradient: LinearGradient(colors: [
                backGroundColor.withOpacity(.8),
                backGroundColor.withOpacity(.4)
              ])),
          child: Image.asset(
            option.image,
            height: 100.sp,
            width: 100.sp,
          ),
        ),
        Container(
          width: 140.sp,
          padding: EdgeInsets.symmetric(
            vertical: 5.sp,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.sp),
                bottomLeft: Radius.circular(10.sp),
              ),
              gradient: const LinearGradient(colors: [
                Colors.red,
                Colors.redAccent,
              ], end: Alignment.topLeft, begin: Alignment.bottomRight)),
          child: Text(
            option.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
        )
      ],
    );
  }
}
