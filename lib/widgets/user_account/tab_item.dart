import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final bool active;
  final IconData icon;

  TabItem(this.active, this.icon);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: active? Colors.black : Colors.white,
            width: 1,
          )
        )
      ),
      child: Icon(
      icon
        )
      )
    );
  }
}