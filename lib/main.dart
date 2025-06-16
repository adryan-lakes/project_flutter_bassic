import 'package:flutter/material.dart';
// import 'widgets/widget_dashboard.dart';
import 'widgets/user_account/user_acc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserAcc(),
    );
  }
}

