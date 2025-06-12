import 'package:flutter/material.dart';

class widget7 extends StatelessWidget {
  const widget7({
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
        body: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.blue,
                          child: Center(child: Text("HELLO" , style: TextStyle(fontSize: 30 ,),),),
                        ),
                        
                        SizedBox(width: 50,),
                      
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.amber,
                          child: Center(child: Text("HELLO" , style: TextStyle(fontSize: 30 ,),),),
                        ),
                      ],
                    ),);
  }
}
