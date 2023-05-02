import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:space_x_rockket_app/util/app_constants.dart';
import 'helper/get_di.dart' as di;
import 'helper/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.APP_NAME,
      navigatorKey: Get.key,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.splash,
      getPages: RouteHelper.routes,
    );
  }
}
