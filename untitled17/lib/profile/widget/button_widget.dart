// import 'dart:html';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
 // final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
   // required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: 100,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(80),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xffffae88), Color(0xff8f93ea)],
      ),
    ),

    child:Center(child: Text('Your Profile'))
  );
}
