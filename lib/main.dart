import 'package:exam2/models/userCardModel.dart';
import 'package:exam2/storage/storage.dart';
import 'package:exam2/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  box = await Hive.openBox('box');
  runApp(const MyApp());
}
//nb=

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  HomePage(),
    );
  }
}
