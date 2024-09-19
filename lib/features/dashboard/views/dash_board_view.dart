import 'package:flutter/material.dart';
import 'package:fruithupdashboard/features/dashboard/views/widgets/dash_board_view_body.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashBoardViewBody(),
    );
  }
}
