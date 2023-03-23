import 'package:nygma/constants/colors.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    this.onPressed,
    required this.text,
    this.isActive = false,
    this.minimumSize = const Size(200, 32),
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isActive;
  final Size minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: isActive ? kOffGreyColor : kOffBlackColor,
        minimumSize: minimumSize,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: isActive ? kWhiteColor : kOffGreyColor,
        ),
      ),
    );
  }
}
