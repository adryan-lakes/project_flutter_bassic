import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              print("button di klik");
            },
            icon: Icon(
              Icons.favorite,
              size: 24.0,
              color: Colors.white,
            ),
            
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline, color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            color: const Color.fromARGB(255, 0, 0, 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) => Row(
                      children: [
                        Container(
                          child: Column(
                            
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 15,
                                        color: const Color.fromARGB(
                                            255, 38, 88, 128),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(250 / 2),
                                      color: const Color.fromARGB(
                                          255, 38, 88, 128),
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 5,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(250 / 2),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://picsum.photos/id/${777 + index}/200/300?grayscale&blur=2"))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "name ${index + 1} " ,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: ListView.builder(
                padding: EdgeInsets.all(50),
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 5,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(250 / 2),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://picsum.photos/id/${777 + index}/200/300?grayscale&blur=2"))),
                                  ),
                                  SizedBox(width: 10,),
                                     Text(
                                              "Username ${index + 1}",
                                              style: TextStyle(fontSize: 25 , color: Colors.white),
                                            ),
                                            
                                    SizedBox(width: 70,),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert), color: Colors.white,)
                        ],
                      ),
                           
                      Container(
                        
                        padding: EdgeInsets.all(5),
                        height: 300,
                        decoration: BoxDecoration(
                         
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://picsum.photos/id/${777 + index}/200/300?grayscale&blur=2",
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
