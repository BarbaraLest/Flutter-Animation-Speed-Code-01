import 'package:flutter/material.dart';
import 'package:flutter_animation_day_night/components/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sun extends StatelessWidget {
  const Sun({
    Key? key,
    @required Duration? duration,
    @required this.isFullSun,
  })  : _duration = duration,
        super(key: key);

  final Duration? _duration;
  final bool? isFullSun;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration!,
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(30),
      bottom: getProportionateScreenWidth(isFullSun! ? -45 : -120),
      child: SvgPicture.asset("assets/imgs/Sun.svg"),
    );
  }
}
