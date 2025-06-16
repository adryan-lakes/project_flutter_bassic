import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width:120,
          height: 120,
          decoration: BoxDecoration(
             gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[ Colors.red,
              Colors.amber,
              ],
             ),
             borderRadius: BorderRadius.circular(65)
          ),
        ),
        Container(
          width:110,
          height: 110,
          decoration: BoxDecoration(
            color:Colors.black,
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
              fit: BoxFit.cover,
            ),
             
             border: Border.all(
              color: Colors.white,
              width: 5,
             ),
             borderRadius: BorderRadius.circular(65)
          ),
        ),
      ],
    );
  }
}
