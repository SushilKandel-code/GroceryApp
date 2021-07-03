import 'package:flutter/material.dart';
import 'package:onlinemarket/elements/constant.dart';
import 'package:onlinemarket/screens/ProductList/productListDesign.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // final _categoryProductListApiService = CategoryProductApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(screenBackgroundColor),
      appBar: _appBarComponent() as PreferredSizeWidget?,
      // body: ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return _categoryProductListComponent(
      //       name: _categoryApiService.categoryProduct!.content![index].name,
      //       price: _categoryApiService.categoryProduct!.content![index].price,
      //       imagePath:
      //           _categoryApiService.categoryProduct!.content![index].imagePath,
      //     )!;
      //   },
      // ),

      body: _categoryProductListComponent(),
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
          // _categoryApiService.categoryProduct!.content![1].name.toString(),
          "ProductList"),
    );
  }

  Widget? _categoryProductListComponent(
      {String? price, String? name, String? imagePath}) {
    return ProductListDesign(
      name: name!,
      price: price!,
      iconData: Icons.shopping_cart_outlined,
      image: imagePath!.toString(),
    );
  }
}
