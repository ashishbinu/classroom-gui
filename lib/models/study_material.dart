import 'dart:convert';

class StudyMaterial {
  StudyMaterial({
    this.title,
    this.url,
    this.topicGroup,
  });

  final String title;
  final String url;
  final String topicGroup;

  factory StudyMaterial.fromRawJson(String str) =>
      StudyMaterial.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory StudyMaterial.fromJson(Map<String, dynamic> json) => StudyMaterial(
        title: json["title"] as String,
        url: json["url"] as String,
        topicGroup: json["topic_group"] as String,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "topic_group": topicGroup,
      };
}
