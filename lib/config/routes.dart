import 'package:get/get.dart';

import '../screens/splash.dart';

abstract class Routes {
  static const initialRoute = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => const Splash()),
  ];
}
