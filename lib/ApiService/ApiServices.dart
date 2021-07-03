import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinemarket/ModelClass/HomeProducts_Models.dart';
import 'package:onlinemarket/ModelClass/categoryContent_Models.dart';

String authority = "gstore.ksushil.com.np";
String unencodedPath = "/api/home.php";
final client = http.Client();

class HomeApiService {
  String authority = "gstore.ksushil.com.np";
  String unencodedPath = "/api/home.php";

  HomeScreenSlide? hotSale;
  HomeScreenSlide? topSale;
  HomeScreenSlide? latestProduct;
  HomeScreenSlide? homeScreenSlide;

  Future<HomeScreenSlide?> getHome() async {
    try {
      final response = await client.get(Uri.https(authority, unencodedPath));

      //  print(response.statusCode);

      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 3));
        homeScreenSlide = HomeScreenSlide.fromJson(
            jsonDecode(response.body)['home_screen_slide']);
        hotSale =
            HomeScreenSlide.fromJson(jsonDecode(response.body)['hot_sale']);
        topSale =
            HomeScreenSlide.fromJson(jsonDecode(response.body)['top_sale']);
        latestProduct = HomeScreenSlide.fromJson(
            jsonDecode(response.body)['latest_product']);

        // for (var i in homeScreenSlide!.homeContents!) {
        //   // ignore: avoid_print
        //   print("price:" + i.price.toString());
        //   print("name:" + i.name.toString());
        //   print("image:" + i.imagePath.toString());
        // }
        return hotSale;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class CategoryApiService {
  String authority = "gstore.ksushil.com.np";
  String unencodedPath = "/api/category.php";
  final client = http.Client();
  Category? category;

  Future<Category?> getCategories() async {
    try {
      final response = await client.get(Uri.https(authority, unencodedPath));
      // print(response.statusCode);
      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 3));
        category = Category.fromJson(jsonDecode(response.body)['category']);
        // for (var i in category!.contents!) {
        //   print("name:" + i.name.toString());
        //   // print("image:" + i.imagePath.toString());
        // }
        return category;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
