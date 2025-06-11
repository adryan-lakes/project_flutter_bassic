import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
              appBar: AppBar(
                leading: FlutterLogo(),
                title: const Text("Dashboard" , style: TextStyle(color: Colors.white, fontSize: 28)),
                backgroundColor: Colors.blue,
                centerTitle: false,
                actions: [
                  IconButton(
                    onPressed: (){
                      print("button di klik");
                    }, 
                    icon: Icon(
                                  Icons.more_vert,
                                  size: 24.0,
                                ),
                    )
                ],
              ),
              body: Center(
                child: Text("Hello World !", 
                style: TextStyle(fontSize: 30),
                ),
              ),
            ),
    );
  }
}