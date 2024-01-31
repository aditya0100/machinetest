import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final dynamic onClick;
  final String title;
  final double x;
  final double y;
  final Color bgcolor;
  final Color textcolor;
  final bool gradient;

  const RoundButton(
      {super.key,
      this.onClick,
      required this.title,
      required this.x,
      required this.y,
      required this.bgcolor,
      required this.textcolor,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: x,
        height: y,
        padding: const EdgeInsets.symmetric(vertical: 10),
        // margin: const EdgeInsets.symmetric(horizontal: -5),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: textcolor,
                // fontWeight: FontWeight.bold,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
