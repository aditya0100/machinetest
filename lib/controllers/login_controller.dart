import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utilities/utils.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxBool showPassword = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool loader = false.obs;

  Future signIn() async {
    loader.value = true;

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((currentUser) async {
      Get.offAndToNamed('/dashboard');
      Utilities.snackbar('Welcome');
    }, onError: (e) {
      Utilities.snackbar(e.code);
    });
    loader.value = false;
  }

  seepassword() {
    showPassword.value = !showPassword.value;
  }

  onLoginTap() {
    if (formKey.currentState!.validate()) {
      signIn();
    }
  }
}
