// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../utilities/formbuilder.dart';
import '../utilities/round_button.dart';
import '../utilities/utils.dart';
import '../utilities/validator.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextStyles(
                  label: "Sign Up",
                  color: Colors.black,
                ).mediumText(),
              ),
            ),
            const Gap(2),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextStyles(
                  label: "Be a member of this exciting app",
                  color: Colors.black,
                ).smallText(),
              ),
            ),
            const Gap(25),
            Form(
              key: controller.formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //email
                    FormBuilder(
                      x: Get.width * 0.8,
                      controller: controller.emailController,
                      inputType: TextInputType.emailAddress,
                      label: 'Email',
                      validator: emailValidator,
                    ).buildTextField(),

                    SizedBox(height: 10),

                    //password
                    Obx(
                      () => FormBuilder(
                              opacity: 1,
                              x: Get.width * 0.8,
                              controller: controller.passwordController,
                              inputType: TextInputType.text,
                              label: 'Password',
                              validator: passwordValidator)
                          .buildPasswordField(controller.showPassword.value,
                              controller.seePassword),
                    ),

                    SizedBox(height: 10),

                    //confirm password
                    Obx(
                      () => FormBuilder(
                              opacity: 1,
                              x: Get.width * 0.8,
                              controller: controller.confirmpasswordController,
                              inputType: TextInputType.text,
                              label: 'Confirm Password',
                              validator: passwordValidator)
                          .buildPasswordField(controller.showcPassword.value,
                              controller.seeConfirmPassword),
                    ),

                    Gap(25),

                    //signup button
                    Obx(
                      () => !controller.loader.value
                          ? RoundButton(
                              onClick: controller.onTap,
                              title: 'Sign up',
                              x: Get.width * 0.8,
                              y: 50,
                              bgcolor: AppColors.blue,
                              textcolor: Colors.white,
                              gradient: true,
                            )
                          : CircularProgressIndicator(
                              color: AppColors.blue,
                            ),
                    ),

                    SizedBox(height: 10),

                    Gap(20),

                    //already a member? login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () => Get.offAndToNamed('/login'),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColors.blue,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
