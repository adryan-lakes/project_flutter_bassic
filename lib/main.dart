import 'package:flutter/material.dart';
import 'package:project_flutter_bassic/widgets/listViewOval.dart';
import 'widgets/widget_7.dart';
import 'widgets/listViewRectangle.dart';
import 'widgets/listViewOval.dart';
import 'widgets/widget_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

