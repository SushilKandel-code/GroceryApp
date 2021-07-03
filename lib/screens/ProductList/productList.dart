import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemarket/ModelClass/categoryProductList_Models.dart';
import 'package:onlinemarket/elements/constant.dart';
import 'package:onlinemarket/screens/ProductList/productDescription.dart';
import 'package:onlinemarket/screens/ProductList/productListDesign.dart';

// ignore: must_be_immutable
class ProductList extends StatefulWidget {
  int? id;
  String? name;
  ProductList({required this.id, required this.name});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<Product> futureProduct;
  Future<Product> fetchProduct() async {
    await Future.delayed(Duration(seconds: 3));
    final response = await http.get(
      Uri.parse(
          'https://gstore.ksushil.com.np/api/category-product.php?cid=${widget.id.toString()}'),
    );

    if (response.statusCode == 200) {
      print('fetching');
      return productFromJson(response.body);
    } else {
      throw Exception('Failed to load Product');
    }
  }

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(screenBackgroundColor),
      appBar: _appBarComponent() as PreferredSizeWidget?,
      body: FutureBuilder<Product>(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.content!.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/Nodata.png',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'No data found',
                      style: GoogleFonts.ubuntu(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.content!.length,
                itemBuilder: (context, index) {
                  return _categoryProductListComponent(
                      name: snapshot.data!.content![index].name!,
                      imagePath:
                          "http://gstore.ksushil.com.np/images/${snapshot.data!.content![index].imagePath!}",
                      price: snapshot.data!.content![index].price!,
                      onPressContainer: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDescription(
                              id: snapshot.data!.content![index].id!,
                              name: snapshot.data!.content![index].name!,
                            ),
                          ),
                        );
                      })!;
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _appBarComponent() {
    return AppBar(
      backgroundColor: appBarColor,
      elevation: 1.0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 20.0,
          ),
          onPressed: () {},
        )
      ],
      title: Text(
        widget.name.toString(),
      ),
    );
  }

  Widget? _categoryProductListComponent(
      {String? price,
      String? name,
      String? imagePath,
      VoidCallback? onPressContainer}) {
    return ProductListDesign(
        name: name!,
        price: price!,
        iconData: Icons.shopping_cart_outlined,
        image: imagePath!.toString(),
        onTap: () => print(name + 'is added to Cart'),
        onPressContainer: onPressContainer!);
  }
}
