import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:space_x_rockket_app/helper/route_helper.dart';
import 'package:space_x_rockket_app/util/theme_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 5;

  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    return Timer(await Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      Get.toNamed(RouteHelper.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff062C56),
      body: Center(
        child: Container(
            child: const Text(
          "SpaceX Rockets",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: ThemeColors.blackColor,
          ),
        )),
      ),
    );
  }
}
