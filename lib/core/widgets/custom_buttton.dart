import 'package:flutter/material.dart';
import 'package:fruithupdashboard/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.white.withOpacity(0.2),
      child: Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 48),
        decoration: ShapeDecoration(
          color: const Color(0xFF1B5E37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyle.body17Bold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
