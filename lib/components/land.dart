import 'package:flutter/material.dart';
import 'package:flutter_animation_day_night/components/size_config.dart';

class Land extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenWidth(-92),
      left: 0,
      right: 0,
      child: Image.asset(
        "assets/imgs/land_tree_light.png",
        height: getProportionateScreenHeight(430),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
