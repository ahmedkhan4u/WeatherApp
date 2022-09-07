import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/bindings/home_binding.dart';
import 'package:weather_app/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      title: "Weather App",
      initialBinding: HomeBinding(),
      initialRoute: Routes.getInitRoute(),
      getPages: Routes.appRoutes,
    );
  }
}
