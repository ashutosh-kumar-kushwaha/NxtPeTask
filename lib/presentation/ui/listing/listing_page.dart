import 'package:flutter/material.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
    Widget _buildList(){
        return ListView.builder(itemBuilder: (context, position){
          
        });
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