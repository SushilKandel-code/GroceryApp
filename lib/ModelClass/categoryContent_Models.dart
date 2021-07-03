import 'dart:convert';

class Category {
  int? status;
  List<Content>? contents;

  Category({this.status, this.contents});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        status: json['status'],
        contents: List.from(jsonDecode(jsonEncode(json['content']))
            .map((e) => Content.fromJson(e as Map<String, dynamic>))),
      );
}

class Content {
  int? id;
  String? name;
  String? imagePath;

  Content({this.id, this.name, this.imagePath});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json['id'],
        name: json['name'] == null ? null : json['name'] as String?,
        imagePath:
            json['image_path'] == null ? null : json['image_path'] as String?,
      );
}
