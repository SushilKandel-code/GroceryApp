// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.status,
    this.content,
  });

  int? status;
  List<Content>? content;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.id,
    this.name,
    this.price,
    this.imagePath,
  });

  int? id;
  String? name;
  String? price;
  String? imagePath;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image_path": imagePath,
      };
}
