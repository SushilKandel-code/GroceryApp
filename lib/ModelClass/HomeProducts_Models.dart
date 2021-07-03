import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel{
  HomeModel({
    this.homeScreenSlide,
    this.topSale,
    this.hotSale,
    this.latestProduct,
    this.cartCount,
  });

  HomeScreenSlide? homeScreenSlide;
  HomeScreenSlide? topSale;
  HomeScreenSlide? hotSale;
  HomeScreenSlide? latestProduct;
  CartCount? cartCount;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        homeScreenSlide: HomeScreenSlide.fromJson(json["home_screen_slide"]),
        topSale: HomeScreenSlide.fromJson(json["top_sale"]),
        hotSale: HomeScreenSlide.fromJson(json["hot_sale"]),
        latestProduct: HomeScreenSlide.fromJson(json["latest_product"]),
        cartCount: CartCount.fromJson(json["cart_count"]),
       
      );
  

  Map<String, dynamic> toJson() => {
        "home_screen_slide": homeScreenSlide!.toJson(),
        "top_sale": topSale!.toJson(),
        "hot_sale": hotSale!.toJson(),
        "latest_product": latestProduct!.toJson(),
        "cart_count": cartCount!.toJson(),
        
      };
}

class CartCount {
  CartCount({
    this.status,
    this.content,
  });

  int? status;
  int? content;

  factory CartCount.fromJson(Map<String, dynamic> json) => CartCount(
        status: json["status"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": content,
      };
}

class HomeScreenSlide {
  HomeScreenSlide({
    this.status,
    this.homeContents,
  });

  int? status;
  List<Content>? homeContents;

  factory HomeScreenSlide.fromJson(Map<String, dynamic> json) =>
      HomeScreenSlide(
        status: json["status"],
        homeContents:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": List<dynamic>.from(homeContents!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.id,
    this.name,
    this.imagePath,
    this.price,
  });

  int? id;
  String? name;
  String? imagePath;
  String? price;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        imagePath: json["image_path"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_path": imagePath,
        "price": price == null ? null : price,
      };
}
