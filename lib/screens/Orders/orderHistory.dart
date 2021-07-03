import 'package:flutter/material.dart';
import 'package:onlinemarket/elements/constant.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
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
          'Order History',
          style: TextStyle(
            color: Color(0xffFFF0E8),
          ),
        ),
      ),
    );
  }
}
