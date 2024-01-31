import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test2/utilities/utils.dart';

import '../core/variables.dart';
import '../models/notemodel.dart';

class HomeController extends GetxController {
  final noteController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final addformKey = GlobalKey<FormState>();
  final editformKey = GlobalKey<FormState>();
  List<NoteModel> notesList = [];

  RxBool isLoading = true.obs;
  late Map notes;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading.value = true;
    await notesRef.child(user.uid).once().then((DatabaseEvent value) {
      notes = value.snapshot.value as Map;

      notes.forEach((key, value) {
        NoteModel noteItem = NoteModel.fromMap(key, value);
        notesList.add(noteItem);
      });
    }).onError((error, stackTrace) {
      return;
    });
    isLoading.value = false;
  }

  addNote() async {
    if (addformKey.currentState!.validate()) {
      await notesRef.child(user.uid).push().update({
        'title': noteController.text,
        'posted On':
            '${DateFormat('dd\'\'MMM\'\'yyyy').format(DateTime.now())} at ${DateFormat('h:mm a').format(DateTime.now())}'
      });
      noteController.clear();
      notesList.clear();
      fetchData();
      Get.back();
      Utilities.snackbar('Note added successfully');
    }
  }

  editNote(String text, String key) async {
    if (editformKey.currentState!.validate()) {
      await notesRef.child(user.uid).child(key).update({
        'title': text,
      });
      notesList.clear();
      fetchData();
      Get.back();
      Utilities.snackbar('Note updated successfully');
    }
  }

  deleteNote(String key) async {
    await notesRef.child(user.uid).child(key).remove();
    notesList.clear();
    fetchData();
    Get.back();
    Utilities.snackbar('Note deleted successfully');
  }
}
