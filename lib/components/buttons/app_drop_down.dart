import 'package:nygma/constants/colors.dart';
import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
  });
  final String label, hint;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 13),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          decoration: const BoxDecoration(
            color: kOffGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 20),
                blurRadius: 60,
                spreadRadius: 0,
              )
            ],
          ),
          child: DropdownButton<String>(
            hint: Text(hint),
            items: items,
            onChanged: onChanged,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(
              Icons.expand_more,
              color: kWhiteColor,
              size: 28.0,
            ),
            dropdownColor: kOffBlackColor,
          ),
        ),
      ],
    );
  }
}
