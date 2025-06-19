import 'package:flutter/material.dart';
import 'package:project_flutter_bassic/models/add_post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/dashboard_view.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:project_flutter_bassic/models/add_post_model.dart';

class PostProvider extends ChangeNotifier {
List<Post> _daftarPost = [];

final String _boxName = 'postingan_box';

List<Post> get daftarPost => _daftarPost;

PostProvider(){
  muatData();
}

  Future<void> muatData() async{
    final box = await Hive.openBox<Post>(_boxName);
    _daftarPost = box.values.toList();
    notifyListeners();
  }



void tambahPost(String nama, String caption) async{
  final postBaru = Post(nama: nama, caption: caption);
  final box = Hive.box<Post>(_boxName);
  await box.add(postBaru);
  
  _daftarPost = box.values.toList();
  
  notifyListeners();
}



Future<void> hapusPost(Post post) async {
  await post.delete();
  await muatData(); 

_daftarPost = Hive.box<Post>(_boxName).values.toList();

}

void toggleLike(Post post) async{
  post.like = !post.like;
   await post.save();
    _daftarPost = Hive.box<Post>(_boxName).values.toList();
    notifyListeners();
  notifyListeners();
}

}