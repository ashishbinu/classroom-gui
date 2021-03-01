import 'dart:convert';

import './study_material.dart';

class Subject {
  Subject({
    this.id,
    this.title,
    // this.youtube,
    this.materials,
  });

  final String id;
  final String title;
  final List<StudyMaterial> materials;
  // final List<StudyMaterial> youtube;

  factory Subject.fromRawJson(String str) =>
      Subject.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"] as String,
        title: json["title"] as String,
        materials: List<StudyMaterial>.from(json["materials"]
                .map((x) => StudyMaterial.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
        // youtube: List<StudyMaterial>.from(json["youtube"]
        //         .map((x) => StudyMaterial.fromJson(x as Map<String, dynamic>))
        //     as Iterable<dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "materials": List<dynamic>.from(materials.map((x) => x.toJson())),
        // "youutube": List<dynamic>.from(youtube.map((x) => x.toJson())),
      };
}
