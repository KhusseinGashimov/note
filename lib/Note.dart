import 'package:flutter/material.dart';

class Note{
  String? id;
  String? noteName;
  bool isDone;

  Note({
    required this.id,
  required this.noteName,
    this.isDone = false,
  });

  static List<Note> noteList(){
    return [
      Note(id: '01', noteName: "First note", isDone: true),
      Note(id: '02', noteName: "Second note", isDone: false),
      Note(id: '03', noteName: "Third note", isDone: true),
      Note(id: '04', noteName: "Fourth note", isDone: true),
      Note(id: '01', noteName: "First note", isDone: false),
      Note(id: '02', noteName: "Second note", isDone: false),
      Note(id: '03', noteName: "Third note", isDone: true),
      Note(id: '04', noteName: "Fourth note", isDone: true),
    ];
  }
}