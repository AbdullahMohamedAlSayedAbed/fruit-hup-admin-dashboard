import 'package:flutter/material.dart';
import 'package:fruithupdashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruithupdashboard/features/dashboard/views/dash_board_view.dart';


abstract class AppRouter {
  static const String dashBoard = 'dashBoard';
  static const String addProduct = 'addProduct';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case dashBoard:
      return MaterialPageRoute(builder: (context) => const DashBoardView());
      case addProduct:
      return MaterialPageRoute(builder: (context) => const AddProductView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}