import 'package:get/get.dart';
import 'package:weather_app/views/home_screen.dart';
import 'package:weather_app/views/splash_screen.dart';

class Routes {
  static String _initialRoute = "/";
  static String homeScreen = "/HomeScreen";
  static String getInitRoute() => _initialRoute;
  static List<GetPage> appRoutes = [
    GetPage(name: _initialRoute, page: () => SplashScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen())
  ];
}
