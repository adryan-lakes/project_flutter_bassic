import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_flutter_bassic/views/user_account/profile_picture.dart';
import 'package:project_flutter_bassic/views/user_account/profile_item.dart';
import 'package:project_flutter_bassic/views/user_account/tab_item.dart';
import 'package:project_flutter_bassic/views/user_account/highlight.dart';

class UserAcc extends StatefulWidget {
  const UserAcc({super.key});

  @override
  State<UserAcc> createState() => _UserAccState();
}

class _UserAccState extends State<UserAcc> {
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Row(
          children: [
            Text(
              "Username",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                ProfilePicture(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileItem("Post", "100"),
                      ProfileItem("Followers", "7000"),
                      ProfileItem("Following", "10"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              text: TextSpan(
                  text:
                      "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "#hastag",
                      style: TextStyle(color: Colors.blue),
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Link goes here",
                style: TextStyle(color: Colors.blue),
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(170, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    onPressed: () {},
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(70, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Share Profile',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(50, 10)),
                      onPressed: () {},
                      child: Icon(
                        Icons.add_reaction_outlined,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HighLight("abcde"),
                  HighLight("fghij"),
                  HighLight("klmno"),
                  HighLight("Story 1"),
                  HighLight("Story 2"),
                  HighLight("Story 3"),
                  HighLight("Story 4"),
                  HighLightAdd("New")
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                TabItem(true, Icons.grid_on_rounded),
                TabItem(false, Icons.video_collection_outlined),
                TabItem(false, Icons.assignment_ind_outlined),
               ],
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: 100,
            itemBuilder: (context, index) => Image.network(
              "https://picsum.photos/id/${237 + index}/200/300",
              fit: BoxFit.cover,
              ),
          ),
        ],
      ),
      
    );
  }
}



