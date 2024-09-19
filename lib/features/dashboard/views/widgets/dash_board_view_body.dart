import 'package:flutter/material.dart';
import 'package:fruithupdashboard/core/utils/app_router.dart';
import 'package:fruithupdashboard/core/widgets/custom_buttton.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.addProduct);
              },
              text: 'add Data'),
        ],
      ),
    );
  }
}
