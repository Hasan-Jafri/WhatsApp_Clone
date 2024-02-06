import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? buttonWidth;
  final String text;
  final VoidCallback onPressed;
  const CustomElevatedButton(
      {super.key,
      this.buttonWidth,
      required this.onPressed,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colours.greenDark,
          foregroundColor: Colours.backgroundDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(text),
      ),
    );
  }
}
