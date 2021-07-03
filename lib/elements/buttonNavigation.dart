import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlinemarket/screens/Cart/cart.dart';
import 'package:onlinemarket/screens/Category/category.dart';
import 'package:onlinemarket/screens/Home/home.dart';
import 'package:onlinemarket/screens/Profile/profile.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  _ButtonNavigationState createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _indexNavigation = 0;
  Text? title;

  final List? _bottomNavWidget = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  final List _buttonNavigationBarItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        size: 30.0,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.dashboard,
        size: 30.0,
      ),
      label: 'Category',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
        size: 30.0,
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.user,
        size: 20.0,
      ),
      label: 'Profile',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _bottomNavWidget!.elementAt(_indexNavigation),
        bottomNavigationBar: bottomNavBarDesign(),
      ),
    );
  }

  Widget bottomNavBarDesign() {
    return BottomNavigationBar(
      items: _buttonNavigationBarItem as List<BottomNavigationBarItem>,
      currentIndex: _indexNavigation,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.red,
      elevation: 10.0,
      iconSize: 20.0,
      onTap: (int index) {
        setState(() {
          _indexNavigation = index;
        });
      },
    );
  }
}
