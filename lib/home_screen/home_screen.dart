import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        actions: const [
          Icon(CupertinoIcons.chat_bubble),
          SizedBox(width: 4),
          Icon(CupertinoIcons.ellipsis_vertical),
          SizedBox(width: 8),
        ],
        title: Text('Curriculum Vitae'),
      ),
    );
  }
}
