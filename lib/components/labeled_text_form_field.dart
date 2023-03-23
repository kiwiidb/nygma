import 'package:nygma/constants/colors.dart';
import 'package:nygma/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LabeledTextFormField extends StatelessWidget {
  const LabeledTextFormField({
    super.key,
    this.labelWidget,
    this.label = '',
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.borderRadius = 35.0,
  });

  final TextEditingController controller;
  final Widget? labelWidget, prefixIcon;
  final String? label, hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: labelWidget != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: labelWidget ?? const SizedBox(),
          ),
        ),
        Visibility(
          visible: labelWidget == null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: Text(
              label!,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 2.0,
                color: kAccentColor,
              ),
            ),
          ),
          style: TextStyle(fontFamily: AppFonts.secondaryFont),
        ),
      ],
    );
  }
}
