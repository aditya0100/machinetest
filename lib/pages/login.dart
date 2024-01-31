// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, nullable_type_in_catch_clause
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../utilities/formbuilder.dart';
import '../utilities/round_button.dart';
import '../utilities/utils.dart';
import '../utilities/validator.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
              child: SingleChildScrollView(
            child: Column(children: [
              Image.asset(
                'assets/logo.png',
                height: 200,
              ),
              const Gap(20),
              TextStyles(label: "Welcome!", color: Colors.black).mediumText(),
              const Gap(4),
              TextStyles(
                      label: "Login with your credentials", color: Colors.black)
                  .smallText(),
              const Gap(20),
              Form(
                key: controller.formKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
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
                                  inputType: TextInputType.visiblePassword,
                                  label: 'Password',
                                  validator: passwordValidator)
                              .buildPasswordField(controller.showPassword.value,
                                  controller.seepassword),
                        ),

                        Gap(25),
                        //signin button
                        Obx(
                          () => !controller.loader.value
                              ? RoundButton(
                                  onClick: controller.onLoginTap,
                                  title: 'Login',
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
                        Gap(10),

                        Gap(60),
                        //not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextStyles(
                                    label: 'Dont have an account? ',
                                    color: Colors.black)
                                .smallText(),
                            GestureDetector(
                              onTap: () => Get.offAndToNamed('/signup'),
                              child: TextStyles(
                                      label: 'Sign up', color: AppColors.blue)
                                  .smallText(),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ]),
          ))),
    );
  }
}
