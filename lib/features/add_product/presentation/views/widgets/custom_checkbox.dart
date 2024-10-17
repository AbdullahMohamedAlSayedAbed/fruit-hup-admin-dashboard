import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool valueCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.2,
        child: Checkbox(
          value: valueCheckBox,
          side: const BorderSide(width: 1.5, color: Color(0xFFDCDEDE)),
          activeColor: const Color(0xFF2D9F5D),
          onChanged: (value) {
            valueCheckBox = value ?? false;
            widget.onChanged(valueCheckBox);
            setState(() {});
          },
        ));
  }
}
