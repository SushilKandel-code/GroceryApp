import 'package:flutter/material.dart';
import 'package:jsend/api_request.dart';
import 'package:onlinemarket/elements/buttonNavigation.dart';
import 'package:onlinemarket/screens/Cart/cart.dart';
import 'package:onlinemarket/screens/Category/category.dart';
import 'package:onlinemarket/screens/Home/home.dart';
import 'package:onlinemarket/screens/Orders/myOrders.dart';
import 'package:onlinemarket/screens/Orders/orderHistory.dart';
import 'package:onlinemarket/screens/ProductList/productList.dart';
import 'package:onlinemarket/screens/Profile/profile.dart';
import 'package:onlinemarket/screens/register.dart';
import 'screens/login.dart';

void main() {
  APIRequest.base = 'http://192.168.100.8:80/gstore/api/';
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Store',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: LoginScreen(),
      home: ButtonNavigation(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => AccountRegister(),
        '/login': (context) => LoginScreen(),
        '/myOrder': (context) => MyOrderScreen(),
        '/orderHistory': (context) => OrderHistoryScreen(),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),
        '/category': (context) => CategoryScreen(),
        '/cart': (context) => CartScreen(),
        '/productList': (context) => ProductList(),
      },
    );
  }
}
