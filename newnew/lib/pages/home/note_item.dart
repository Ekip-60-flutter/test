import 'dart:convert';

NoteItem noteItemFromJson(String str) => NoteItem.fromJson(json.decode(str));

String noteItemToJson(NoteItem data) => json.encode(data.toJson());

class NoteItem{
  String? title;
  String? desc;
  String? date;
  bool? check;

  NoteItem({ this.title,  this.desc,  this.date, this.check = false});

  factory NoteItem.fromJson(Map<String, dynamic> json) => NoteItem(
        title: json["title"],
        desc: json["desc"],
        date: json["date"],
        check: json["check"]
    );

  Map<String, dynamic> toJson() => {
    "title": title,
    "desc": desc,
    "date": date.toString(),
    "check": check
  };
}