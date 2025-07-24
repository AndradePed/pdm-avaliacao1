import 'package:flutter/material.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'BookMark',
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold
          ),
          ),
      ),
      );    
  }
}