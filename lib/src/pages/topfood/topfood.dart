import 'package:flutter/material.dart';

class Topfood extends StatelessWidget {
  const Topfood({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Top Food',
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
    );
  }
}