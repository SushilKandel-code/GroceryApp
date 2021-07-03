import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlinemarket/elements/constant.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List products = [];
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 20.0,
          leading: Icon(Icons.arrow_back),
          backgroundColor: appBarColor,
          title: Text(
            'Cart',
            style: TextStyle(
              color: Color(0xffFFF0E8),
            ),
          ),
        ),
        body: products.isNotEmpty ? _emptyCart() : _cartContent(),
      ),
    );
  }

  Widget _emptyCart() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(screenBackgroundColor),
      child: Center(
        child: Text(
          'Empty Cart',
        ),
      ),
    );
  }

  Widget _cartContent() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(screenBackgroundColor),
      child: Center(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 2.0,
                  color: Colors.grey.shade300,
                  style: BorderStyle.solid),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: textName,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Price',
                              style: textName,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0, top: 5.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              } else {
                                quantity = 1;
                                print('Minimum quantity must be 1');
                              }
                            });
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.minus,
                            size: 20.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          quantity.toString(),
                          style: textName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0, top: 1.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.plus,
                            size: 20.0,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, top: 5.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_forever,
                            size: 25.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
