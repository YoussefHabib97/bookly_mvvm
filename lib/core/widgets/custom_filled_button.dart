import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String buttonText;
  final BorderRadius borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final void Function()? onPressed;

  const CustomFilledButton({
    super.key,
    required this.borderRadius,
    required this.buttonText,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    required this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 48,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          buttonText,
          style: Styles.textStyle14.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
