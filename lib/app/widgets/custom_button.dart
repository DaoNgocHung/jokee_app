import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.textStyle,
    this.widthBtn = 130,
    this.heightBtn = 40,
    this.padding,
    this.radius = 0,
  });

  final Function() onTap;
  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final double? widthBtn;
  final double heightBtn;
  final EdgeInsets? padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthBtn,
        height: heightBtn,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(title, style: textStyle),
        ),
      ),
    );
  }
}
