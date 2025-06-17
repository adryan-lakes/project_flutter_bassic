import 'package:flutter/material.dart';
import 'user_account/user_acc.dart';
import 'dashboard/widget_dashboard.dart';
import 'package:project_flutter_bassic/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _halaman=<Widget>[
    DashboardPage(),
    UserAcc(),
    UserAcc(),
    UserAcc(),
    

  ];

  final snackBar = SnackBar(content: Text("Postingan berhasil dibuat"),);

  Future<void> _tampilkanDialogPostingsan() async {
    final String? hasil = await showDialog<String>(
        context: context,
        builder: (context) {
          final TextEditingController controller = TextEditingController();
          return AlertDialog(
            title: Text("Masukan nama dan caption"),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(hintText: "Nama "),
            ),
            

            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Batal")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(controller.text);
                  },
                  child: Text("Posting"))
            ],
          );
        });

    if (hasil != null && hasil.isNotEmpty) {
      context.read<PostProvider>().tambahPost(hasil);
      setState(() {
        _selectedIndex = 0;
         ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
  
  void _onItemTapped(int index){
    if(index == 2){
      _tampilkanDialogPostingsan();
    }else{
    setState(() {
      _selectedIndex = index;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body:IndexedStack(
      index: _selectedIndex > 2 ? _selectedIndex - 1 : _selectedIndex,
      children: _halaman,
    ),

          bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, 
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search),
        label: "search",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add),
        label: "Post",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined),
        label: "Reels",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person),
        label: "Account",
        ),
      ],
    ),
            
          );;
  }
}