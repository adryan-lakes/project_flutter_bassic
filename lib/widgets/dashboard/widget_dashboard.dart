import 'package:flutter/material.dart';
import 'package:project_flutter_bassic/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/post_provider.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<String> _daftarNama = [];
  

  

void prrint(){
  for(String nam in _daftarNama){
print(nam);
  }
}

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();
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
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.messenger_outline,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          story_oval(),
          Postingan(daftarPost: postProvider.daftarPost),
          // ElevatedButton(
          //   onPressed: () {
          //     prrint();
          //     _tampilkanDialogPostingsan();
          //   },
          //   child: Icon(
          //     Icons.add,
          //     size: 24.0,
          //   ),
          // ),
        
        ],
      ),
    );
  }
}

class Postingan extends StatelessWidget {
  final List<String> daftarPost;
  const Postingan({required this.daftarPost});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        child: ListView.builder(
          padding: EdgeInsets.all(50),
          itemCount: daftarPost.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 5,
                              color:
                                  const Color.fromARGB(255, 255, 255, 255),
                            ),
                            borderRadius: BorderRadius.circular(250 / 2),
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://picsum.photos/id/${777 + index}/200/300?grayscale&blur=2"))),
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      "${daftarPost[index]}",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                        color: Colors.white,
                      ),
                    
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
                     Favorite(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class story_oval extends StatelessWidget {
  const story_oval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 25,
                                    color: const Color.fromARGB(
                                        255, 38, 88, 128),
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(250 / 2),
                                  color: const Color.fromARGB(
                                      255, 38, 88, 128),
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
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
                          "nama ${index + 1}",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool _favorite = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(onPressed:(){
        
        setState(() {
          // _favorite = true;
          _favorite = !_favorite;
        });
      }, icon: Icon(Icons.favorite),
      color: _favorite ? Colors.red : Colors.grey, 
      ),
    );
  }
}
