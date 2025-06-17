import 'package:flutter/material.dart';
import 'package:project_flutter_bassic/widgets/main_page.dart';
import 'widgets/dashboard/widget_dashboard.dart';
import 'widgets/user_account/user_acc.dart';
import 'package:provider/provider.dart';
import 'post_provider.dart';

void main() {
  
  runApp(
     ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MyApp()
     )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

