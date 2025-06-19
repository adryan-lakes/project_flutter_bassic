import 'package:flutter/material.dart';

class widget8 extends StatelessWidget {
  const widget8({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlutterLogo(),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              print("button di klik");
            },
            icon: Icon(
              Icons.more_vert,
              size: 24.0,
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(50),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
              image: DecorationImage(
                fit:BoxFit.cover,
                image: NetworkImage(
                  "https://picsum.photos/id/${777 + index}/200/300?grayscale&blur=2",
                ),
              ),
            ),
            child: Text(
              "Helo ${index + 1}",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
