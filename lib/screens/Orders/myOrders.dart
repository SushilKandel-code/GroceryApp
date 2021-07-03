import 'package:flutter/material.dart';
import 'package:onlinemarket/elements/constant.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        leading: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: appBarColor,
        title: Text(
          'My Orders',
          style: TextStyle(
            color: Color(0xffFFF0E8),
          ),
        ),
      ),
    );
  }
}
