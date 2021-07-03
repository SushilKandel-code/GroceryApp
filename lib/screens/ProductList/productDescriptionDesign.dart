import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProductDescriptionDesign extends StatefulWidget {
  String? name, price, description, image, unit;

  ProductDescriptionDesign({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.unit,
  });

  @override
  _ProductDescriptionDesignState createState() =>
      _ProductDescriptionDesignState();
}

class _ProductDescriptionDesignState extends State<ProductDescriptionDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(children: [
          imageDesign()!,
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              widget.name!,
              style: GoogleFonts.ubuntu(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Rs.' +
                  widget.price.toString() +
                  '/- per ' +
                  widget.unit!.toLowerCase(),
              style: GoogleFonts.ubuntu(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              widget.description!,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ]));
  }

  Widget? imageDesign() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Image.network(widget.image!),
    );
  }
}
