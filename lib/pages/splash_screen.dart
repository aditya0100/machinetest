import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() { 
  super.initState();
  Timer(const Duration(seconds: 2), 
        ()=>Get.offAndToNamed('/login')
  );      
} 

  @override
  Widget build(BuildContext context) {
        return Container(
          color: Colors.white,
          child: ClipRect( 
              child: SizedBox.fromSize( 
            child: Center(child: Image.asset('assets/logo.png',fit: BoxFit.contain,)), 
              ), 
          ),
        ); 
  }
}
