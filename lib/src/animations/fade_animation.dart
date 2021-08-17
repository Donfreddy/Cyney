import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum Props { opacity, translateX, translateY }
enum Translate { x, y }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final Translate translate;

  const FadeAnimation({
    Key key,
    this.delay,
    this.child,
    this.translate = Translate.x,
  })  : assert(delay != null, 'Please set property delay. Example: 0.5'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<Props>()
      ..add(Props.opacity, 0.0.tweenTo(1.0), 300.milliseconds)
      ..add(
        translate == Translate.x ? Props.translateX : Props.translateY,
        130.0.tweenTo(0.0),
        300.milliseconds,
        Curves.easeOut,
      );

    return CustomAnimation(
      tween: _tween,
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: _tween.duration,
      builder: (_, Widget child, MultiTweenValues<Props> value) {
        return Opacity(
          opacity: value.get(Props.opacity),
          child: Transform.translate(
            offset: translate == Translate.x
                ? Offset(value.get(Props.translateX), 0)
                : Offset(0, value.get(Props.translateY)),
            child: child,
          ),
        );
      },
    );
  }
}
