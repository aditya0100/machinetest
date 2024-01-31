// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:test2/utilities/notecard.dart';
import 'package:test2/utilities/utils.dart';
import '../controllers/home_controller.dart';
import '../utilities/formbuilder.dart';
import '../utilities/outlined_button.dart';
import '../utilities/round_button.dart';
import '../utilities/validator.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            TextStyles(label: 'Your Notes', color: Colors.black).mediumText(),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.blue,
            ));
          } 
          else if(controller.notesList.isEmpty){
 return const Center(
                child: Text('No notes available!')
            );
          } 
          else {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.notesList.length,
                itemBuilder: (BuildContext context, int index) {
                  final editController = TextEditingController();
                  editController.text = controller.notesList[index].title;
                  
                  return NoteCard(
                    onEdit: () => Get.defaultDialog(
                      title: '',
                      backgroundColor: Colors.white,
                      content: Column(
                        children: [
                          Form(
                            key: controller.editformKey,
                            child: FormBuilder(
                              controller: editController,
                              validator: textValidator,
                              inputType: TextInputType.text,
                              label: 'Your note',
                              x: Get.width,
                            ).buildDescriptionField(5),
                          ),
                          const Gap(20),
                          RoundButton(
                            onClick: () => controller.editNote(editController.text,controller.notesList[index].key),
                            title: 'Update note',
                            x: Get.width * 0.6,
                            y: 50,
                            bgcolor: Colors.blue,
                            textcolor: AppColors.white,
                            gradient: true,
                          ),
                          const Gap(15),
                          OutlineButton(
                            textcolor: AppColors.blue,
                            bordercolor: AppColors.blue,
                            onClick: () => Get.back(),
                            title: 'Cancel',
                            x: Get.width * 0.6,
                            y: 50,
                          ),
                        ],
                      ),
                    ),
                    onDelete: () => Utilities.customDialog(
                        'Yes, delete', 'Are you sure?', ()=>controller.deleteNote(controller.notesList[index].key), Icons.delete),
                    title: controller.notesList[index].title,
                    subtitle: controller.notesList[index].postedOn,
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => Get.defaultDialog(
          title: '',
          backgroundColor: Colors.white,
          content: Column(
            children: [
              Form(
                key: controller.addformKey,
                child: FormBuilder(
                  controller: controller.noteController,
                  validator: textValidator,
                  inputType: TextInputType.text,
                  label: 'Your note',
                  x: Get.width,
                ).buildDescriptionField(5),
              ),
              const Gap(20),
              RoundButton(
                onClick: () => controller.addNote(),
                title: 'Add note',
                x: Get.width * 0.6,
                y: 50,
                bgcolor: Colors.blue,
                textcolor: AppColors.white,
                gradient: true,
              ),
              const Gap(15),
              OutlineButton(
                textcolor: AppColors.blue,
                bordercolor: AppColors.blue,
                onClick: () => Get.back(),
                title: 'Cancel',
                x: Get.width * 0.6,
                y: 50,
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.blue,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
