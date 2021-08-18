import 'package:flutter/material.dart';

class HearAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final bool alwaysAnimate;
  final Duration duration;
  final VoidCallback? onEnd;

  HearAnimationWidget({
    Key? key,
    required this.child,
    required this.isAnimating,
    this.alwaysAnimate =false,
    this.duration = const Duration(microseconds: 150),
    this.onEnd,
  });

  @override
  _HearAnimationWidgetState createState() => _HearAnimationWidgetState();
}

class _HearAnimationWidgetState extends State<HearAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    final halfDuration = widget.duration.inMilliseconds ~/ 2;
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: halfDuration));
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant HearAnimationWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      doAnimation();
    }
  }

  Future doAnimation() async {
    if (widget.isAnimating || widget.alwaysAnimate) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(Duration(milliseconds: 400));
      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
