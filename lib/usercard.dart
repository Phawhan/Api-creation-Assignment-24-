import 'package:flutter/material.dart';


class UserCard extends StatefulWidget {
  dynamic user;
  UserCard({super.key, required this.user});

  @override
  
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(children: [
        
        Row(
          children: [Text("User Id : "), Text(widget.user['id'].toString())],
        ),
        Row(
          children: [const Text("User Name : "), Text(widget.user['name'])],
        ),
        Row(
          children: [Text("User Username : "), Text(widget.user['username'])],
        ),
        Row(
          children: [Text("User emailID : "), Text(widget.user['email'])],
        ),
      ]),
    );
  }
}