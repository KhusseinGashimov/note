import 'package:flutter/material.dart';
import 'package:note/Note.dart';
import 'package:note/constant.dart';

class Notes extends StatelessWidget {
  final Note note;

  const Notes({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
