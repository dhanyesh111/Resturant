import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleWithIcon extends StatelessWidget {
  Widget child;
  Color? color;
  void Function()? onTap;
  EdgeInsetsGeometry? padding;

  CircleWithIcon(
      {super.key, required this.child, this.color, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.all(3.sp),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        duration: const Duration(milliseconds: 350),
        child: child,
      ),
    );
  }
}
