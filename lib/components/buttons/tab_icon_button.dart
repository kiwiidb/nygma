import 'package:nygma/constants/colors.dart';
import 'package:flutter/material.dart';

class TabIconButton extends StatelessWidget {
  const TabIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
    this.isActive = false,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: isActive ? kOffGreyColor : kOffBlackColor,
        minimumSize: Size(38, 38),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5.0,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          SizedBox(width: 15, height: 15, child: icon),
          Visibility(
            visible: isActive,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isActive ? kWhiteColor : kOffGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
