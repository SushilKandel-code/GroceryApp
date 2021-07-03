import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemarket/ModelClass/productDescription_Model.dart';
import 'package:onlinemarket/elements/constant.dart';
import 'package:onlinemarket/screens/ProductList/productDescriptionDesign.dart';

// ignore: must_be_immutable
class ProductDescription extends StatefulWidget {
  int? id;
  String? name;

  ProductDescription({required this.id, required this.name});

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  late Future<ProductDescriptionModel>? futureProduct;

  Future<ProductDescriptionModel> fetchProductDescription(int id) async {
    await Future.delayed(Duration(seconds: 3));
    final response = await http.get(
      Uri.parse(
          'https://gstore.ksushil.com.np/api/product-info.php?pid=${id.toString()}'),
    );

    print(
        'https://gstore.ksushil.com.np/api/product-info.php?pid=${id.toString()}');

    if (response.statusCode == 200) {
      print('fetching');
      return productDescriptionModelFromJson(response.body);
    } else {
      throw Exception('Failed to load Product Description');
    }
  }

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProductDescription(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(screenBackgroundColor),
        appBar: _appBarComponent() as PreferredSizeWidget?,
        body: FutureBuilder<ProductDescriptionModel>(
          future: futureProduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _productDescription(
                name: snapshot.data!.content!.name!,
                description: snapshot.data!.content!.details,
                unit: snapshot.data!.content!.unit,
                imagePath:
                    "http://gstore.ksushil.com.np/images/${snapshot.data!.content!.imagePath!}",
                price: snapshot.data!.content!.price!,
              )!;
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
        bottomSheet: Container(
          margin: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Add to Cart',
              style: buttonStyle1,
            ),
          ),
        ),
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

  Widget? _productDescription(
      {String? price, String? name, unit, String? imagePath, description}) {
    return ProductDescriptionDesign(
      description: description!,
      unit: unit!,
      name: name!,
      price: price!,
      image: imagePath!.toString(),
    );
  }
}
