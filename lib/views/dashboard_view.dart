import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/post_provider.dart';
import '../models/add_post_model.dart'; 


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    final postProvider = context.watch<PostProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.messenger_outline, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [

          story_oval(),

          
          Expanded(
            
            child: ListView.builder(
              itemCount: postProvider.daftarPost.length,
              itemBuilder: (context, index) {
               
                final post = postProvider.daftarPost[index];
               
                return Postingan(post: post);
              },
            ),
          ),
        ],
      ),
    );
  }
}
// widget postingan
class Postingan extends StatelessWidget {
 
  final Post post;
  
  const Postingan({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage("https://picsum.photos/id/${700 + post.hashCode % 100}/200/300"),
                  backgroundColor: Colors.black,
                ),
                const SizedBox(width: 10),
                Text(post.nama, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(onPressed: (){
                  context.read<PostProvider>().hapusPost(post);
                }, child: Icon(Icons.delete)),
                const Icon(Icons.more_vert, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 10),

        
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://picsum.photos/id/${800 + post.hashCode % 100}/600/800"),
              ),
            ),
          ),
          const SizedBox(height: 5),

        
          Row(
            children: [
              IconButton(
                onPressed: () {
           
                  context.read<PostProvider>().toggleLike(post);
                },
                icon: Icon(
                  // Tampilan ikon tergantung dari data 'post.like'
                  post.like ? Icons.favorite : Icons.favorite_border,
                  color: post.like ? Colors.red : Colors.black,
                ),
              ),
              const IconButton(onPressed: null, icon: Icon(Icons.comment_outlined, color: Colors.black)),
         
            ],
          ),

    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(post.nama, style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,),),
                  SizedBox(width: 20,),
                Text(  
                  post.caption,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
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
      color: const Color.fromARGB(255, 255, 255, 255),
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
                                    color:
                                        const Color.fromARGB(255, 38, 88, 128),
                                  ),
                                  borderRadius: BorderRadius.circular(250 / 2),
                                  color: const Color.fromARGB(255, 38, 88, 128),
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  borderRadius: BorderRadius.circular(250 / 2),
                                  color: const Color.fromARGB(255, 0, 0, 0),
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
                            color: Colors.black,
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
      trailing: IconButton(
        onPressed: () {
          setState(() {
            // _favorite = true;
            _favorite = !_favorite;
          });
        },
        icon: Icon(Icons.favorite),
        color: _favorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
