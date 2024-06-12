import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FlipCard extends StatelessWidget {
  final RxBool isForward = true.obs;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget firstChild;
  final Widget secondChild;
  FlipCard(
      {super.key,
      this.onTap,
      this.onLongPress,
      required this.firstChild,
      required this.secondChild});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: () {
        isForward.value = !isForward.value;
        onLongPress;
      },
      child: Obx(() {
        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            transitionBuilder: (Widget child, Animation<double> value) {
              final rotateAnimation = Tween(begin: pi, end: 0.0).animate(value);
              return AnimatedBuilder(
                animation: rotateAnimation,
                child: child,
                builder: (context, widget) {
                  final value = min(rotateAnimation.value, pi / 2);

                  return Transform(
                    transform: Matrix4.rotationY(value),
                    alignment: Alignment.center,
                    child: widget,
                  );
                },
              );
            },
            child: isForward.value ? firstChild : secondChild);
      }),
    );
  }
}
