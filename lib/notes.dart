import 'package:flutter/material.dart';
import 'package:note/Note.dart';
import 'package:note/constant.dart';

class Notes extends StatelessWidget {
  final Note note;
  final onNoteChanged;
  final onDeleteNote;

  const Notes({Key? key, required this.note, this.onNoteChanged, this.onDeleteNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onNoteChanged(note);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          note.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlack,
        ),
        title: Text(
          note.noteName!,
          style: TextStyle(
              fontSize: 16,
            color: tdBlack,
            decoration: note.isDone ? TextDecoration.lineThrough : TextDecoration.none
          ),

        ),
        trailing: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteNote(note.id);
            },
          ),
        ),
      ),
    );
  }
}
