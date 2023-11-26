import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_app/app/utils/color_constant.dart';

class AppUtils {
  /// FOR SHOWING THE CUSTOM SNACK BAR
  static void showSnackBar(
    String message, {
    String title = 'Important',
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
    SnackStyle snackBarStyle = SnackStyle.GROUNDED,
  }) {
    Get.snackbar(
      title,
      message,
      duration: duration,
      snackPosition: position,
      snackStyle: snackBarStyle,
    );
  }

  /// FOR SHOWING THE SUCCESS SNACK BAR
  static void successSnackBar({String title = 'Success', String? message}) {
    Get.log("[$title] $message");
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(title.tr,
            style: Get.textTheme.headline6!
                .merge(const TextStyle(color: ColorConstant.white))),
        messageText: Text(message!,
            style: Get.textTheme.caption!
                .merge(const TextStyle(color: ColorConstant.white))),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.green,
        icon: const Icon(Icons.check_circle_outline,
            size: 32, color: ColorConstant.white),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        borderRadius: 8,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  /// FOR SHOWING THE ERROR SNACK BAR
  static void errorSnackBar({String title = 'Error', String? message}) {
    Get.log("[$title] $message", isError: true);
    Get.showSnackbar(GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6!
              .merge(const TextStyle(color: ColorConstant.white))),
      messageText: Text(message!.substring(0, min(message.length, 200)),
          style: Get.textTheme.caption!
              .merge(const TextStyle(color: ColorConstant.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.remove_circle_outline,
          size: 32, color: ColorConstant.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    ));
  }
}
