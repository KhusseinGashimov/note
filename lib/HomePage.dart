
import 'package:flutter/material.dart';
import 'package:note/constant.dart';
import 'package:note/dialog.dart';
import 'package:note/notes.dart';

import 'Note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final noteList = Note.noteList();
  List<Note> _foundNote = [];
  final _noteController = TextEditingController();


  @override
  void initState() {
    _foundNote = noteList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      onChanged: (value)=>_runFilter(value),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: tdBlack,
                            size: 20,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 20, minWidth: 25),
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: tdGrey)),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        for (Note notee in _foundNote.reversed)
                          Notes(
                              note: notee,
                              onNoteChanged: _handleNoteChange,
                              onDeleteNote: _deleteNoteChange)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }


  void _handleNoteChange(Note note) {
    setState(() {
      note.isDone = !note.isDone;
    });
  }

  void _runFilter(String enteredKey) {
    List<Note> results = [];
    if (enteredKey.isEmpty) {
      results = noteList;
    } else {
      results = noteList
          .where((item) =>
              item.noteName!.toLowerCase().contains(enteredKey.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundNote =results;
    });
  }
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _noteController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  void saveNewTask() {
    setState(() {
      setState(() {
        noteList.add(Note(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            noteName: _noteController.text));
        _noteController.clear();
      });
    });
    Navigator.of(context).pop();
  }

  void _deleteNoteChange(String id) {
    setState(() {
      noteList.removeWhere((item) => item.id == id);
    });
  }
}
