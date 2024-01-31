import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final dynamic onClick;
  final String title;
  final double x;
  final double? y;
  final Color textcolor;
  final Color bordercolor;
  const OutlineButton(
      {super.key,
      this.onClick,
      required this.title,
      required this.x,
       this.y, required this.textcolor, required this.bordercolor});

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
          border: Border.all(color: bordercolor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: textcolor,
                // fontWeight: FontWeight.bold,
                fontSize: 15,
                fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
