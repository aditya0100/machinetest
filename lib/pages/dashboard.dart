// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';



class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
          Obx(
            () => Center(
                child:
                    controller.widgetOptions[controller.selectedIndex.value]),
          ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            iconSize: 30.0,
            // backgroundColor: Colors.grey,
            onTap: (val) => controller.onItemTapped(val),
          ),
        ));
  }
}
