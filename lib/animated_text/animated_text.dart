import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../app_colors/app_colors.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final RxBool isForward = false.obs;
  TextStyle? style;
  AnimatedText({super.key, required this.text, this.style});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TweenAnimationBuilder(
          onEnd: () => Future.delayed(
                const Duration(seconds: 2),
                () => isForward.value = !isForward.value,
              ),
          tween: isForward.value
              ? IntTween(begin: text.length, end: 0)
              : IntTween(begin: 0, end: text.length),
          duration: Duration(milliseconds: 250 * text.length),
          builder: (context, count, child) {
            return RichText(
              text: TextSpan(
                  text: text.characters.take(count).toString(),
                  style: style ?? TextStyle(color: AppColors.white),
                  children: [
                    TextSpan(
                      text: " |",
                      style: style ??
                          TextStyle(
                              color: AppColors.white
                                  .withOpacity(count.isEven ? 0 : 1)),
                    )
                  ]),
            );
          });
    });
  }
}
