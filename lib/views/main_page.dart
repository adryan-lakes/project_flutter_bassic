import 'package:flutter/material.dart';
import 'package:project_flutter_bassic/views/halaman_home.dart';
import 'user_account/user_acc.dart';
import 'dashboard_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:project_flutter_bassic/views/add_post_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const Center(child: Text("Halaman Search Segera Hadir")),
    const Center(child: Text("Halaman Reels Segera Hadir")),
    const UserAcc(),
  ];

  void _bukaHalamanTambahPost() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPost()),
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      _bukaHalamanTambahPost();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _mapTabIndexToPageIndex(_selectedIndex),
        children: _pages,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        color: Colors.grey,
        activeColor: Colors.black,
        top: 0,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),        
          TabItem(icon: Icons.search, title: 'Search'),   
          TabItem(icon: Icons.add, title: 'Post'),       
          TabItem(icon: Icons.video_collection, title: 'Reels'),    
          TabItem(icon: Icons.person, title: 'Account'),  
        ],
        onTap: _onItemTapped,
        initialActiveIndex: _selectedIndex,
      ),
    );
  }

  int _mapTabIndexToPageIndex(int tabIndex) {
    if (tabIndex < 2) { 
      return tabIndex;
    }
    if (tabIndex > 2) { 
      return tabIndex - 1;
    }

    final previousPageIndex = _selectedIndex < 2 ? _selectedIndex : _selectedIndex -1;
    return previousPageIndex;
  }
}