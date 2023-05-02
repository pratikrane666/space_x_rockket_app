import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x_rockket_app/data/model/response/rocket_model.dart';
import 'package:space_x_rockket_app/view/screens/home/detail_screen.dart';
import 'package:space_x_rockket_app/view/screens/home/home_screen.dart';
import 'package:space_x_rockket_app/view/screens/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String detail = '/detail';

  static String getInitialRoute() => '$initial';
  static String getSplashRoute() {
    return '$splash';
  }

  static String getHomeRoute() {
    return '$home';
  }

  static String getDetailRoute(RocketModel _rocketList) {
    String rocketData =
        base64Url.encode(utf8.encode(jsonEncode(_rocketList.toJson())));

    return '$detail?rocketDetail=$rocketData';
  }

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () {
          return SplashScreen();
        }),
    GetPage(
        name: home,
        page: () {
          return HomeScreen();
        }),
    GetPage(
        name: detail,
        page: () {
          return DetailScreen(
            rocketDetail: RocketModel.fromJson(jsonDecode(utf8
                .decode(base64Url.decode(Get.parameters['rocketDetail']!)))),
          );
        }),
  ];

  static getRoute(Widget navigateTo) {
    return navigateTo;
  }
}
