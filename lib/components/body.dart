import 'package:flutter/material.dart';
import 'package:flutter_animation_day_night/components/land.dart';
import 'package:flutter_animation_day_night/components/rounded_text_field.dart';
import 'package:flutter_animation_day_night/components/size_config.dart';
import 'package:flutter_animation_day_night/components/tabs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isFullSun = false;
  bool _isDayMode = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isFullSun = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      Color(0xFF61245A),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (_isFullSun) Color(0xFFFF9080),
    ];

    List<Color> darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];

    Duration _duration = Duration(seconds: 1);
    return AnimatedContainer(
      duration: _duration,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDayMode ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: _duration,
            bottom: getProportionateScreenHeight(_isFullSun ? -80 : -200),
            left: getProportionateScreenWidth(30),
            child: SvgPicture.asset("assets/imgs/Sun.svg"),
          ),
          Land(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {
                      if (value == 0) {
                        _isDayMode = true;

                        Future.delayed(Duration(microseconds: 300), () {
                          setState(() {
                            _isFullSun = true;
                          });
                        });
                      } else {
                        _isFullSun = false;
                        Future.delayed(Duration(microseconds: 300), () {
                          setState(() {
                            _isDayMode = false;
                          });
                        });
                      }
                    },
                  ),
                  VerticalSpacing(),
                  Text(
                    "Goog morning",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  VerticalSpacing(of: 10),
                  Text(
                    "Enter your informations below",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  VerticalSpacing(of: 50),
                  RoundedTextField(
                    initialValue: "exemplo@email.com",
                    hintText: "Email",
                  ),
                  VerticalSpacing(),
                  RoundedTextField(
                    initialValue: "************",
                    hintText: "Password",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
