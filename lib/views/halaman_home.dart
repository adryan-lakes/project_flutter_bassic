import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_flutter_bassic/models/add_post_model.dart';
import 'package:project_flutter_bassic/controllers/post_provider.dart';
class HalamanHome extends StatelessWidget {
  const HalamanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, PostProvider, child){
      return ListView.builder(
        itemCount: PostProvider.daftarPost.length,
        itemBuilder: (BuildContext context, int index) {
          final post = PostProvider.daftarPost[index];
          return Postingan(post : post);
        },
      );
    });
  }
}

class Postingan extends StatelessWidget {
  final Post post;
  const Postingan({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final postProvider = context.read<PostProvider>();
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          
        ),
      borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(width: 10),
              Text(post.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),

        SizedBox(height: 20,),

        Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
              image: DecorationImage(
                image: NetworkImage("https://picsum.photos/id/${200 + post.hashCode % 200}/400/300"),
                fit: BoxFit.cover,
              )
            ),
          ),

        SizedBox(height: 20,),

        Row(
            children: [
              IconButton(
                onPressed: () {
                  // Panggil method dari provider untuk mengubah state favorit.
                  postProvider.toggleLike(post);
                },
                icon: Icon(
                  post.like ? Icons.favorite : Icons.favorite_border,
                  color: post.like ? Colors.red : Colors.grey,
                ),
              ),
              const IconButton(onPressed: null, icon: Icon(Icons.comment_outlined)),
            ],
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(post.caption),
           ),

        ],
      )
    );
      

    
  }
}