import 'dart:convert';
import 'dart:io';

import "package:flutter/material.dart";
import 'package:databaseapp/usercard.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  List<dynamic> users = [];
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mock Data")),
      body: ListView.builder(
          itemCount: widget.users.length,
          itemBuilder: ((context, index) {
            print(widget.users[index]);
            print(index);
            return UserCard( user: widget.users[index],);
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: collectData,
        child: Icon(Icons.add),
      ),
    );
  }

  void collectData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(url);
    var body = response.body;
    // for (int i = 0; i < body.length; i++) {
    //   print(body);
    // }
    widget.users = jsonDecode(body);

    setState(() {
      widget.users = jsonDecode(body);
    });
    print(body);
  }
}