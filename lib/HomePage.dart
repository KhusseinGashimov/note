import 'package:flutter/material.dart';
import 'package:note/constant.dart';
import 'package:note/notes.dart';

import 'Note.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final noteList = Note.noteList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon: Icon(Icons.search, color: tdBlack, size: 20,),
                          prefixIconConstraints: BoxConstraints(
                              maxHeight: 20,
                              minWidth: 25
                          ),
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: tdGrey)
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        for( Note notee in noteList)
                          Notes(note: notee,onNoteChanged: _handleNoteChange,onDeleteNote:
                              _deleteNoteChange
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0,0),
                        blurRadius: 10,
                        spreadRadius: 0
                      ),],
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Добавить заметку",
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 20,right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ElevatedButton(
                        onPressed: (){

                        },
                        child: Text('+',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          primary: tdBlue,
                          minimumSize: Size(60, 60),
                          elevation: 10
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  void _handleNoteChange(Note note){
    setState(() {
      note.isDone =!note.isDone;
    });
  }
  void _deleteNoteChange(String id){
    setState(() {
      noteList.removeWhere((item) =>item.id==id);
    });
  }
}
