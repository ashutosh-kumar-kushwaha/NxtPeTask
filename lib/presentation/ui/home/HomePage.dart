import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    Widget _buildList(){
        return Placeholder()
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Products", style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
        ),
        body: _buildList(),
    );
  }
}