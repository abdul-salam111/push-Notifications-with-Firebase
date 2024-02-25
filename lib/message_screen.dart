import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String?id;
  const MessageScreen({super.key,this.id});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.id.toString()),),
    );
  }
}