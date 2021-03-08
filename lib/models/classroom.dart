import 'dart:convert';

import 'subject.dart';

class ClassRoom {
  ClassRoom({
    this.subjects,
  });

  final List<Subject>? subjects;

  factory ClassRoom.fromRawJson(String str) =>
      ClassRoom.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory ClassRoom.fromJson(Map<String, dynamic> json) => ClassRoom(
        subjects: List<Subject>.from(json["subjects"].map(
          (x) => Subject.fromJson(x as Map<String, dynamic>),
        ) as Iterable<dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "subjects": List<dynamic>.from(subjects!.map((x) => x.toJson())),
      };
}
