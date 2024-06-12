import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParallaxFlowDelegateHorizontal extends FlowDelegate {
  ParallaxFlowDelegateHorizontal({
    required this.scrollable,
    required this.listItemContext,
  }) : super(repaint: scrollable.position);
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final RenderBox scrollableBox =
        scrollable.context.findRenderObject() as RenderBox;
    final RenderBox listItemBox =
        listItemContext.findRenderObject() as RenderBox;
    final Offset listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);
    final double viewportDimension = scrollable.position.viewportDimension;
    final double scrollFraction =
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);
    final verticalAlignment = Alignment(
      (scrollFraction * 10 - 1),
      0.0,
    );
    final Size listItemSize = context.size;
    final Rect childRect = verticalAlignment.inscribe(
        Size(Get.width, Get.height), Offset.zero & listItemSize);

    context.paintChild(
      0,
      transform: Transform.translate(
          offset: Offset(
        childRect.left,
        0,
      )).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegateHorizontal oldDelegate) {
    return false;
  }
}

class ParallaxFlowDelegateVertical extends FlowDelegate {
  ParallaxFlowDelegateVertical({
    required this.scrollable,
    required this.listItemContext,
  }) : super(repaint: scrollable.position);
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final RenderBox scrollableBox =
        scrollable.context.findRenderObject() as RenderBox;
    final RenderBox listItemBox =
        listItemContext.findRenderObject() as RenderBox;
    final Offset listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);
    final double viewportDimension = scrollable.position.viewportDimension;
    final double scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);
    final Alignment verticalAlignment = Alignment(0.0, scrollFraction * 10 - 1);
    final Size listItemSize = context.size;
    final Rect childRect = verticalAlignment.inscribe(
        Size(Get.width, Get.height * .8), Offset.zero & listItemSize);

    context.paintChild(
      0,
      transform: Transform.translate(
          offset: Offset(
        0,
        childRect.top,
      )).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegateVertical oldDelegate) {
    return false;
  }
}
