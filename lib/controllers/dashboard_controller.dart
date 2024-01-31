import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/pages/home.dart';
import 'package:test2/pages/profile.dart';

class DashboardController extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;

  RxInt selectedIndex = 0.obs;

  dynamic data;

  @override
  void onInit() {
    super.onInit();
  }

  onItemTapped(int val) {
    selectedIndex.value = val;
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> widgetOptions = <Widget>[Home(), const UserProfile()];
}
