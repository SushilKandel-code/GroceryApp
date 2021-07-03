import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProductListDesign extends StatefulWidget {
  final String name, price;
  final IconData iconData;
  final String image;
  Color iconColor = Colors.red;

  ProductListDesign({
    required this.name,
    required this.price,
    required this.iconData,
    required this.image,
  });

  @override
  _ProductListDesignState createState() => _ProductListDesignState();
}

class _ProductListDesignState extends State<ProductListDesign> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 20, left: 70, right: 30),
        height: 120.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 0.5,
                  offset: Offset(0.5, 0.5),
                  color: Colors.grey.shade500)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0, top: 10),
              child: Row(
                children: [
                  Text(
                    widget.name,
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      child: Icon(
                        widget.iconData,
                        size: 30.0,
                        color: widget.iconColor,
                      ),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 108.0),
              child: Text(
                widget.price,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 30.0, bottom: 30),
                child: CircleAvatar(
                  //backgroundImage: widget.image,
                  maxRadius: 50,
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
