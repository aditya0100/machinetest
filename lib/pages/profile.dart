import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../utilities/validator.dart';
import '../utilities/formbuilder.dart';
import '../utilities/round_button.dart';
import '../utilities/utils.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return Obx(() => controller.loader.value != true
                ? Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(
                      child: Column(children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 60,
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                        const Gap(25),
                        TextStyles(
                                label: '',
                                color: AppColors.blue,
                                align: TextAlign.center)
                            .mediumText(),
                        const Divider(
                          height: 0,
                          color: Colors.grey,
                        ),
                        const Gap(40),
                        TextStyles(
                                label: 'Account Details',
                                color: Colors.blue,
                                align: TextAlign.center)
                            .mediumText(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              width: Get.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Column(
                                    children: [
                                      //email
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: TextStyles(
                                                    label: 'Email',
                                                    color: Colors.black)
                                                .smallText(),
                                          )),
                                      const Gap(5),
                                      FormBuilder(
                                        textcolor: Colors.black,
                                        readOnly: true,
                                        x: Get.width * 0.8,
                                        controller: controller.emailController,
                                        inputType: TextInputType.emailAddress,
                                        label: 'Email',
                                        validator: emailValidator,
                                      ).buildTextField(),

                                      Gap(10),

                                      //created at
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: TextStyles(
                                                    label: 'Account created on',
                                                    color: Colors.black)
                                                .smallText(),
                                          )),
                                      const Gap(5),
                                      FormBuilder(
                                        textcolor: Colors.black,
                                        readOnly: true,
                                        x: Get.width * 0.8,
                                        label: 'created on',
                                        controller:
                                            controller.createdAtController,
                                        inputType: TextInputType.emailAddress,
                                        validator: emailValidator,
                                      ).buildTextField(),

                                      Gap(20),

                                      //logout
                                      RoundButton(
                                        onClick: controller.clickLogout,
                                        title: 'Logout',
                                        x: Get.width * 0.8,
                                        y: 50,
                                        bgcolor: AppColors.blue,
                                        textcolor: AppColors.white,
                                        gradient: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                  ));
          }),
    );
  }
}
