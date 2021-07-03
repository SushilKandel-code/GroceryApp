import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlinemarket/elements/constant.dart';
import 'package:onlinemarket/elements/drawer.dart';
import 'package:onlinemarket/screens/Home/homeComponent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget? selectedSearch;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(screenBackgroundColor),
        appBar: _appBarComponent() as PreferredSizeWidget?,
        drawer: DrawerComponent(),
        body: HomeComponent(),
      ),
    );
  }

  Widget _appBarComponent() {
    return AppBar(
      backgroundColor: appBarColor,
      elevation: 1.0,
      actions: [
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.search,
            color: Colors.white,
            size: 20.0,
          ),
          onPressed: () {
            setState(() {
              if (selectedSearch == _noSearchContainerComponent()) {
                selectedSearch = _searchContainerComponent();
              } else
                selectedSearch = _noSearchContainerComponent();
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: selectedSearch = _noSearchContainerComponent(),
          ),
        ],
      ),
    );
  }

  Widget _searchContainerComponent() {
    return Container(
      height: 35.0,
      width: 205.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xffF3F3F3),
          )
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xfff3f3f3),
          contentPadding: EdgeInsets.all(10.0),
          hintText: "Search",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _noSearchContainerComponent() {
    return Container(
      height: 30.0,
      width: 100.0,
      child: Text('Home'),
    );
  }
}
