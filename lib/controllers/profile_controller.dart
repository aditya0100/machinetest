import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/variables.dart';
import '../utilities/utils.dart';


class ProfileController extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;
  final emailController = TextEditingController();
  final createdAtController = TextEditingController();

  RxBool loader = false.obs;
  RxBool deleteLoading = false.obs;

  dynamic data;

  @override
  void onInit() {
    loader.value = true;
    super.onInit();
    usersRef.once().then((value) {
      data = value.snapshot.value;
      emailController.text = data[user.uid]["email"];
      createdAtController.text = data[user.uid]["createdAt"];
      loader.value = false;
    });
  }


  logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
    Utilities.snackbar('Logged out successfully');
  }

  clickLogout() {
    Utilities.customDialog('Log  Out',
        'Are you sure to log out of your account?', logout, Icons.logout);
  }

}
