import 'package:flutter/cupertino.dart';

class CustomAnimatedIcon extends StatelessWidget {
  final bool value;
  final Widget firstChild;
  final Widget secondChild;
  final void Function()? onTap;
  CustomAnimatedIcon(
      {super.key,
      required this.firstChild,
      required this.secondChild,
      this.onTap,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.5).animate(anim)
                    : Tween<double>(begin: 0.5, end: 1).animate(anim),
                child: ScaleTransition(scale: anim, child: child),
              ),
          child: value ? firstChild : secondChild),
    );
  }
}
