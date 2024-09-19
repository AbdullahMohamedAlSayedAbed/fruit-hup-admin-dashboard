import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruithupdashboard/core/utils/app_router.dart';
import 'package:fruithupdashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DashBoard());
}

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.dashBoard,
    );
  }
}
