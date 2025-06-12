import 'package:flutter/material.dart';

class Oval extends StatelessWidget {
  const Oval({
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack( 
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 260,
                    width: 260,
                    
                    decoration: BoxDecoration(
                       border: Border.all(
                                        width: 15,
                                        
                                        color: const Color.fromARGB(255, 38, 88, 128),
                                      ),
                      borderRadius: BorderRadius.circular(250 / 2),color: const Color.fromARGB(255, 38, 88, 128),
                    ),
                      
                  ),
                  Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      border: Border.all(
                                        width: 5,
                                        
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                      borderRadius: BorderRadius.circular(250 / 2),color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://picsum.photos/id/777/200/300?grayscale&blur=2") 
                        )
                  
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20,),
              Text("name" , style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            ],
          ),
        
            
          ),
        );
  }
}
