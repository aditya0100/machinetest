import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/variables.dart';
import '../utilities/utils.dart';

class SignUpController extends GetxController {

  var defaultImage = const AssetImage('assets/user.png');

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final positionController = TextEditingController();
  final deptController = TextEditingController();

  RxString imgPath = ''.obs;

  RxBool showPassword = false.obs;
  RxBool showcPassword = false.obs;
  RxBool loader = false.obs;

  void signUp() async {
    loader.value=true;

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text.toLowerCase().trim(),
            password: passwordController.text.trim())
        .then((currentUser) async {
      usersRef.child(currentUser.user!.uid).set({
        "createdAt": "${DateFormat('dd\'\'MMM\'\'yyyy').format(DateTime.now())} at ${DateFormat('h:mm a').format(DateTime.now())}",
        "email": emailController.text.trim()
      });
      Utilities.snackbar('Account created successfully! Now you can login');
      Get.offAndToNamed('/login');
    }, onError: (e) {
      Utilities.snackbar(e.message);
    });
    loader.value=false;
  }

  seePassword() {
    showPassword.value = !showPassword.value;
  }

  seeConfirmPassword() {
    showcPassword.value = !showcPassword.value;
  }

  onTap() {
    if (formKey.currentState!.validate()) {
          if (confirmpasswordController.text != passwordController.text) {
      Utilities.snackbar('Passwords do not match');
      return;
    }
      signUp();
    }
  }
}
