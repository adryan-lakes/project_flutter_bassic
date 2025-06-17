import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/dashboard/widget_dashboard.dart';

class PostProvider extends ChangeNotifier {
List<String> _daftarPost = [];

List<String> get daftarPost => _daftarPost;

PostProvider(){
  muatData();
}

  Future<void> muatData() async{
    final prefe = await SharedPreferences.getInstance();
    
    _daftarPost = prefe.getStringList("key_daftar_nama") ?? <String>[];
    
    notifyListeners();
  }

  Future<void> _simpanData() async{
    final prefe = await SharedPreferences.getInstance();
    print("menyimpan data $_daftarPost");
   await prefe.setStringList("key_daftar_nama", _daftarPost);
   notifyListeners();
  }


void tambahPost(String PostBaru){
  _daftarPost.add(PostBaru);
  _simpanData();
  notifyListeners();
}

void hapusPost(int index){
  _daftarPost.remove(index);
  _simpanData();
  notifyListeners();
}


}