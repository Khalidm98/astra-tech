import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/widgets.dart';

abstract class Dialogs {
  static void loading({required String content}) {
    Get.defaultDialog(
      title: 'Loading',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Widgets.loading,
          Widgets.spacingHorizontal,
          Text(content),
        ],
      ),
    );
  }
}
