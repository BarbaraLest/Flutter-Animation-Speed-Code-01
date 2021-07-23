import 'package:flutter/material.dart';
import 'package:flutter_animation_day_night/components/body.dart';
import 'package:flutter_animation_day_night/components/size_config.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body()
    );
  }
}