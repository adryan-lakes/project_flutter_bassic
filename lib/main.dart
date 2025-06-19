import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_flutter_bassic/models/add_post_model.dart';
import 'package:project_flutter_bassic/views/main_page.dart';
import 'views/dashboard_view.dart';
import 'views/user_account/user_acc.dart';
import 'package:provider/provider.dart';
import 'controllers/post_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(PostAdapter());

  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
