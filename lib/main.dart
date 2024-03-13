import 'package:flutter/material.dart';
import 'package:next_pe_task/presentation/ui/home/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[900]),
      home: HomePage(),
    );
  }
  
}