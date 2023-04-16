import 'package:flutter/material.dart';
import 'package:note/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
      ),
      body: Container(
        child: Text("123"),
      ),
    );
  }
}
