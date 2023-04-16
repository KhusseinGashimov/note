import 'package:flutter/material.dart';

import 'notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notesList = [
    ["First note", false],
    ["Second note", false],
    ["Third note", false],
    ["Fourth note", true],
    ["Fifth note", true],
    ["Sixth note", true],
    ["Seventh note", false],
  ];

  void checkBoxChanged(bool value,int index){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          return Notes(
              noteName: notesList[index][0], noteCompleted: notesList[index][1],
              onChanged: (value)=>checkBoxChanged);
        },
      ),
    );
  }
}
