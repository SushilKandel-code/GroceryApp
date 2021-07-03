import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onlinemarket/ApiService/ApiServices.dart';
import 'package:onlinemarket/elements/constant.dart';
import 'package:onlinemarket/screens/ProductList/productDescription.dart';
import 'package:onlinemarket/screens/ProductList/productList.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({Key? key}) : super(key: key);

  @override
  _HomeComponentState createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  bool? isLoading = true;
  final _service = CategoryApiService();
  final _homeService = HomeApiService();

  @override
  void initState() {
    super.initState();
    _service.getCategories().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    _homeService.getHome().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> _pullRefresh() async {
    setState(() {
      isLoading = true;
      _homeService.getHome();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: ListView(
        children: [
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _homeService.homeScreenSlide!.homeContents!.length,
                itemBuilder: (context, index) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                    ),
                    items: [
                      Image.network(
                        "http://gstore.ksushil.com.np/images/${_homeService.homeScreenSlide!.homeContents![index].imagePath}",
                      ),
                    ],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child: Text("Categories", style: textName),
                ),
                SizedBox(
                  height: 140,
                  child: isLoading == true
                      ? Center(
                          child: const CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _service.category!.contents!.length,
                          itemBuilder: (context, index) {
                            return _categoryComponent(
                                imagePath:
                                    "http://gstore.ksushil.com.np/images/${_service.category!.contents![index].imagePath}",
                                name: _service.category!.contents![index].name,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductList(
                                          name: _service
                                              .category!.contents![index].name,
                                          id: _service
                                              .category!.contents![index].id),
                                    ),
                                  );
                                });
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Text("Hot Sell", style: textName),
                ),
                SizedBox(
                  height: 400,
                  child: isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 70.0,
                          ),
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemCount: _homeService.hotSale!.homeContents!.length,
                          itemBuilder: (context, index) {
                            return _hotSaleComponent(
                                name: _homeService
                                    .hotSale!.homeContents![index].name,
                                image:
                                    "http://gstore.ksushil.com.np/images/${_homeService.hotSale!.homeContents![index].imagePath}",
                                price: _homeService
                                    .hotSale!.homeContents![index].price,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDescription(
                                        id: _homeService
                                            .hotSale!.homeContents![index].id!,
                                        name: _homeService.hotSale!
                                            .homeContents![index].name!,
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Text("Top Sell", style: textName),
                ),
                SizedBox(
                  height: 400.0,
                  child: isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 70.0,
                          ),
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemCount: _homeService.topSale?.homeContents!.length,
                          itemBuilder: (context, index) {
                            return _topSaleComponent(
                                name: _homeService
                                    .topSale!.homeContents![index].name,
                                image:
                                    "http://gstore.ksushil.com.np/images/${_homeService.topSale!.homeContents![index].imagePath}",
                                price: _homeService
                                    .topSale!.homeContents![index].price,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDescription(
                                        id: _homeService
                                            .topSale!.homeContents![index].id!,
                                        name: _homeService.topSale!
                                            .homeContents![index].name!,
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Text("Latest Products", style: textName),
                ),
                SizedBox(
                  height: 400,
                  child: isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 70.0,
                          ),
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemCount: _homeService.topSale?.homeContents!.length,
                          itemBuilder: (context, index) {
                            return _latestProductComponent(
                                name: _homeService
                                    .latestProduct!.homeContents![index].name,
                                image:
                                    "http://gstore.ksushil.com.np/images/${_homeService.latestProduct!.homeContents![index].imagePath}",
                                price: _homeService
                                    .latestProduct!.homeContents![index].price,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDescription(
                                        id: _homeService.latestProduct!
                                            .homeContents![index].id!,
                                        name: _homeService.latestProduct!
                                            .homeContents![index].name!,
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryComponent(
      {String? name, String? imagePath, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        // color: Colors.blue,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 30.0,
                  child: Image.network(
                    imagePath!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  name!,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hotSaleComponent(
      {@required String? image,
      @required String? name,
      @required VoidCallback? onTap,
      @required String? price}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 250.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Center(
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      name!,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Price: " + price!,
                      style: priceTextStyle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _topSaleComponent(
      {@required String? image,
      @required String? name,
      @required VoidCallback? onTap,
      @required String? price}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 250.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Center(
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      name!,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Price: " + price!, style: priceTextStyle),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _latestProductComponent(
      {@required String? image,
      @required String? name,
      @required VoidCallback? onTap,
      @required String? price}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 250.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Center(
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      name!,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Price: " + price!, style: priceTextStyle),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
