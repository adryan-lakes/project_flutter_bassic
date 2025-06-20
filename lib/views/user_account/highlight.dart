import 'package:flutter/material.dart';

class HighLightAdd extends StatelessWidget {
  final String title;
  HighLightAdd(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.grey[300],
                ),
              ),
              Container(
                height: 67,
                width: 67,
                child: Icon(Icons.add),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    ),
              ),
            ],
          ),
          Text(title)
        ],
      ),
    );
  }
}

class HighLight extends StatelessWidget {
  final String title;
  HighLight(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.grey[300],
                ),
              ),
              Container(
                height: 67,
                width: 67,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://picsum.photos/id/800/600/800"),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Text(title)
        ],
      ),
    );
  }
}
