import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';

class Preference {

  /// #Bir dona object uchun
  static Future<bool> storeNote(Note note) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringNote = jsonEncode(note.toJson());
    if (kDebugMode) {
      print("Encode String text: $stringNote");
    }
    return await prefs.setString("note", stringNote);
  }

  static Future<Note?> loadNote() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringNote = prefs.getString("note");
    if(stringNote == null || stringNote.isEmpty) return null;

    Map<String,dynamic> map = jsonDecode(stringNote);
    return Note.fromJson(map);
  }

  static Future<bool> removeNote() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("note");
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /// #List object uchun
  static Future<bool> storeNoteList(List<Note> list) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> stringList = list.map((note) => jsonEncode(note.toJson())).toList();
    return await pref.setStringList('listNotes', stringList);
  }

  static Future<List<Note>> loadNoteList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // List<Note>? noteList =  pref.getStringList("noteList")?.map((stringNote) => Note.fromJson(jsonDecode(stringNote))).toList();
    List<String>? stringList = pref.getStringList('listNotes');
    List mapList = stringList!.map((string) => jsonDecode(string)).toList();
    List<Note> noteList = mapList.map((json) => Note.fromJson(json)).toList();
    return noteList;
  }

  static Future<bool> removeNoteList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("listNotes");
  }
}

