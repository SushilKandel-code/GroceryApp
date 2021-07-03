import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextField extends StatefulWidget {
  final String hintText, labelText;
  final bool obsecureText;
  Icon prefixIcon;
  Function? onValidate;
  final TextEditingController controller;

  InputTextField(
      {required this.prefixIcon,
      required this.hintText,
      required this.labelText,
      required this.onValidate,
      required this.controller,
      this.obsecureText = false});

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0, right: 25.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(5, 5))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: widget.controller,
          validator: widget.onValidate as String? Function(String?)?,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            hintText: widget.hintText,
            border: InputBorder.none,
            prefixIcon: widget.prefixIcon,
            labelText: widget.labelText,
          ),
        ));
  }
}
