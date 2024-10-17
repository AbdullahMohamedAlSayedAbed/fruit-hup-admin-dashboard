import 'package:flutter/material.dart';
import 'package:fruithupdashboard/core/utils/app_style.dart';
import 'package:fruithupdashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

class IsFeaturedItemWidget extends StatefulWidget {
  const IsFeaturedItemWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeaturedItemWidget> createState() => _IsFeaturedItemWidgetState();
}

class _IsFeaturedItemWidgetState extends State<IsFeaturedItemWidget> {
  bool valueCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'is featured item? ',
                    style: AppStyle.body13Semibold.copyWith(
                      color: const Color(0xFF949D9E),
                    )),
              ],
            ),
          ),
        ),
        CustomCheckbox(onChanged: widget.onChanged),
      ],
    );
  }
}
