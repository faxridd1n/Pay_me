import 'package:flutter/material.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>

{
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 41, 48),
        title: Text(
          'All cart',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Home(),
    );
  }
}
