import 'package:get/get.dart';

import '../controllers/photo_controller.dart';
import '../screens/auth/login.dart';
import '../screens/auth/register.dart';
import '../screens/photo/photo_add.dart';
import '../screens/photo/photo_info.dart';
import '../screens/photo/photo_list.dart';
import '../screens/splash.dart';

abstract class Routes {
  static const initialRoute = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => const Splash()),
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/register', page: () => Register()),
    GetPage(
      name: '/photo',
      page: () => const PhotoList(),
      binding: PhotoBinding(),
      children: [
        GetPage(name: '/add', page: () => const PhotoAdd()),
        GetPage(name: '/:name', page: () => const PhotoInfo()),
      ],
    ),
  ];
}
