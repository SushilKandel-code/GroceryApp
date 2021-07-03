import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: [
          new UserAccountsDrawerHeader(
            accountName: Text('Sushil Kandel'),
            accountEmail: Text(
              "sushilKandel@gmail.com",
            ),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.person),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ),
          InkWell(
            child: ListTile(
              title: Text('Home'),
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('Category'),
              leading: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/category');
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('Cart'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/myOrder');
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('Order History'),
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/orderHistory');
            },
          ),
          InkWell(
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Divider(
            thickness: 1.0,
          ),
          InkWell(
            child: ListTile(
              title: Text('Setting'),
              leading: Icon(
                Icons.settings,
                color: Colors.red,
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: ListTile(
              title: Text('About'),
              leading: Icon(
                Icons.info,
                color: Colors.red,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
