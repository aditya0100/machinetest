// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/utilities/utils.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final dynamic onEdit;
  final dynamic onDelete;

  const NoteCard(
      {super.key, required this.title, required this.subtitle, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: Get.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.threeLine,
            trailing: SizedBox(
              width: Get.width * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: onEdit,
                      child: Icon(
                        Icons.edit,
                        size: 25,
                        color: Colors.grey,
                      )),
                  InkWell(
                      onTap: onDelete,
                      child: Icon(
                        Icons.delete,
                        size: 25,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            title: SizedBox(
                width: Get.width * 0.8,
                child: TextStyles(label: title, color: Colors.black, size: 18)
                    .smallText()),
            subtitle:
                TextStyles(label: subtitle, color: Colors.black).smallText(),
          ),
        ),
      ),
    );
  }
}
