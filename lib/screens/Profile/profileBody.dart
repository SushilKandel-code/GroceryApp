import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade200,
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 40, right: 40),
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sushil Kandel",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "sushil.kandel16@gmail.com",
                          style: TextStyle(height: 2),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 35),
                profileInitialData(),
                SizedBox(height: 25),
                profileFinalData()
              ],
            ),
          ),
        ]));
  }

  Widget profileInitialData() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(blurRadius: 2, color: Colors.grey.shade400),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Column(
                children: [
                  Icon(Icons.shopping_bag_outlined,
                      size: 25, color: Colors.amber),
                  Text("My Orders", style: TextStyle(fontSize: 15)),
                ],
              ),
              onTap: () => Navigator.pushNamed(context, '/myOrder'),
            ),
            VerticalDivider(
              color: Colors.grey.shade500,
              thickness: 1.0,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/orderHistory'),
              child: Column(
                children: [
                  Icon(Icons.shopping_basket_outlined,
                      size: 25, color: Colors.red),
                  Text("Order History", style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.grey.shade500,
              thickness: 1.0,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/cart'),
              child: Column(
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 25, color: Colors.red),
                  Text("Cart", style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileFinalData() {
    return Container(
      height: 330.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey.shade400)]),
      child: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("General",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.people_alt_outlined),
                      SizedBox(width: 10),
                      Text("My Information"),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.lock_open_outlined),
                      SizedBox(width: 10),
                      Text("Change Password"),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 10),
                      Text("Change Shipping Address"),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.privacy_tip_outlined),
                      SizedBox(width: 10),
                      Text("Privacy Policy"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.privacy_tip_sharp),
                      SizedBox(width: 10),
                      Text("Terms and Conditions"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.info_outline),
                      SizedBox(width: 10),
                      Text("About"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(width: 10),
                      Text("Log out"),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
