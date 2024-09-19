import 'package:flutter/material.dart';
import 'package:fruithupdashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AddProductViewBody(),
    );
  }
}
