import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlinemarket/elements/constant.dart';
import 'package:onlinemarket/screens/Profile/profileBody.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(screenBackgroundColor),
        appBar: AppBar(
          elevation: 20.0,
          leading: Icon(Icons.arrow_back),
          backgroundColor: appBarColor,
          title: Text(
            'Profile',
            style: TextStyle(
              color: Color(0xffFFF0E8),
            ),
          ),
        ),
        body: ProfileBody(),
      ),
    );
  }
}
