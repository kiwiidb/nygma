import 'package:nygma/constants/colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard(
      {super.key,
      this.padding = const EdgeInsets.fromLTRB(30.0, 20.0, 24.0, 30.0),
      this.margin,
      this.radius = 20.0,
      this.child});

  final EdgeInsetsGeometry? padding, margin;
  final Widget? child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: kOffGreyColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: child,
    );
  }
}
