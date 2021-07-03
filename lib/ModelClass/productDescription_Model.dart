// To parse this JSON data, do
//
//     final productDescriptionModel = productDescriptionModelFromJson(jsonString);

import 'dart:convert';

ProductDescriptionModel productDescriptionModelFromJson(String str) =>
    ProductDescriptionModel.fromJson(json.decode(str));

String productDescriptionModelToJson(ProductDescriptionModel data) =>
    json.encode(data.toJson());

class ProductDescriptionModel {
  ProductDescriptionModel({
    this.status,
    this.content,
  });

  int? status;
  Content? content;

  factory ProductDescriptionModel.fromJson(Map<String, dynamic> json) =>
      ProductDescriptionModel(
        status: json["status"],
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": content!.toJson(),
      };
}

class Content {
  Content({
    this.id,
    this.categoryId,
    this.name,
    this.price,
    this.unit,
    this.imagePath,
    this.details,
  });

  int? id;
  int? categoryId;
  String? name;
  String? price;
  String? unit;
  String? imagePath;
  String? details;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        price: json["price"],
        unit: json["unit"],
        imagePath: json["image_path"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "price": price,
        "unit": unit,
        "image_path": imagePath,
        "details": details,
      };
}
