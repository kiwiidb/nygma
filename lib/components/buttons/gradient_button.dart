import 'package:nygma/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    this.text = '',
    this.child,
    this.fontSize,
    this.width = double.infinity,
    this.height = 50,
    this.gradient = kGradient,
  });

  final Widget? child;
  final VoidCallback onPressed;
  final String text;
  final double? fontSize, width, height;
  final Gradient gradient;
  static const double borderRadius = 28.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 20),
            blurRadius: 60,
            spreadRadius: 0,
          ),
        ],
      ),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.16), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.4],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
            child: Center(
              child: child ??
                  Text(
                    text.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize ?? 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
