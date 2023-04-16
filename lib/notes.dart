import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  final String noteName;
  final bool noteCompleted;
  Function(bool?)? onChanged;

  Notes(
      {Key? key,
      required this.noteName,
      required this.noteCompleted,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(value: noteCompleted, onChanged: onChanged),
            Text(noteName),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
