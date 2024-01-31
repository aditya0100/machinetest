// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'outlined_button.dart';
import 'round_button.dart';

class AppColors {
  static const Color gradientTop = Color.fromARGB(255, 0, 141, 255);
  static const Color gradientDown = Color.fromARGB(255, 118, 203, 251);
  static const Color blue = Colors.blue;
  static const Color white = Colors.white;
}

class TextStyles {
  final String label;
  final Color color;
  final TextAlign? align;
  final double? size;

  TextStyles({required this.label, required this.color, this.align, this.size});

  Text smallText() {
    return Text(
      label,
      style: TextStyle(
          color: color, fontSize: size ?? 15, fontWeight: FontWeight.w400),
      textAlign: align,
    );
  }

  Text mediumText() {
    return Text(
      label,
      style: TextStyle(
          color: color, fontSize: size ?? 25, fontWeight: FontWeight.w500),
      textAlign: align,
    );
  }

  static const Text largeText = Text('data');
}

class Utilities {
  static void snackbar(String msg) {
    // Get.snackbar('', msg);
    Get.rawSnackbar(
      message: msg,
      duration: Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      borderRadius: 5,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.blue,
    );
  }

  static void customDialog(
      String title, String middletext, dynamic onClick, IconData icon) {
    Get.defaultDialog(
        title: '',
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: Get.width * 0.8,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: AppColors.blue,
                    size: 60,
                  ),
                  Gap(25),
                  Text(
                    middletext,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Gap(20),
                  RoundButton(
                      onClick: onClick,
                      title: title,
                      x: Get.width * 0.6,
                      y: 50,
                      bgcolor: Colors.blue,
                      textcolor: AppColors.white,
                      gradient: true),
                  Gap(15),
                  OutlineButton(
                      textcolor: AppColors.blue,
                      bordercolor: AppColors.blue,
                      onClick: () => Get.back(),
                      title: 'Cancel',
                      x: Get.width * 0.6,
                      y: 50)
                ],
              ),
            ),
          ),
        ));
  }
}
