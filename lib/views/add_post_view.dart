import 'package:flutter/material.dart';
import 'package:project_flutter_bassic/main.dart';
import 'package:project_flutter_bassic/models/add_post_model.dart';
import 'package:project_flutter_bassic/views/dashboard_view.dart';
import 'package:project_flutter_bassic/controllers/post_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AddPost());
}

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPost();
}

class _AddPost extends State<AddPost> {

  final _namaConttroler = TextEditingController();
  final _captionsConttroler = TextEditingController();

 @override
void dispose() {
  _namaConttroler.dispose();
  _captionsConttroler.dispose();
  super.dispose();
}


void _kirimPost(){
  if(_namaConttroler.text.isNotEmpty && _namaConttroler.text.isNotEmpty){
    context.read<PostProvider>().tambahPost(_namaConttroler.text, _captionsConttroler.text);
    Navigator.of(context).pop();
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}

  final snackBar = SnackBar(content: Text("Postingan berhasil dibuat"),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            
        title:  Text("New post"),
         
        actions:  [
          ElevatedButton(onPressed: _kirimPost, child: Text("Post"))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(10), 
      child: Column(
        children: [
          Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: _namaConttroler,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: "masukan nama",
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          controller: _captionsConttroler,
                          decoration: const InputDecoration(
                            labelText: 'Captions',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              
                            ),
                            
                          ),
                          onChanged: (value) {},
                        ),
                      ),
        ],
      ),
      )
    );
  }
}



  // Future<void> _tampilkanDialogPostingsan() async {
  //   final String? hasil = await showDialog<String>(
  //       context: context,
  //       builder: (context) {
  //         final TextEditingController controller = TextEditingController();
  //         return AlertDialog(
  //           title: Text("Masukan nama"),
  //           content: TextField(
  //             controller: controller,
  //             autofocus: true,
  //             decoration: InputDecoration(hintText: "Nama "),
  //           ),
            

  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text("Batal")),
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop(controller.text);
  //                 },
  //                 child: Text("Posting"))
  //           ],
  //         );
  //       });

  //   if (hasil != null && hasil.isNotEmpty) {
  //     context.read<PostProvider>().tambahPost(hasil);
  //     setState(() {
  //        ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     });
  //   }
  // }