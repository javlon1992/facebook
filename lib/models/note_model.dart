import 'dart:convert';

class Note {
  late int id;
  late DateTime createTime;
  late String title;
  late String content;

  Note({
    required this.id,
    required this.createTime,
    required this.title,
    required this.content,
  });

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = DateTime.parse(json['createTime']);
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'createTime' : createTime.toString().substring(0,16),
    'title' : title,
    'content' : content,
  };

  // static String encode(List<Note> notes) => jsonEncode(
  //     notes.map<Map<String, dynamic>>((note) => note.toJson()).toList());
  //
  // static List<Note> decode(String notes) =>
  //     jsonDecode(notes).map<Note>((item) => Note.fromJson(item)).toList();

}