import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlinemarket/elements/inputComponents.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle textStyle = TextStyle(
      color: Color(0xFF3F51B5), fontSize: 32.0, fontWeight: FontWeight.bold);

  TextStyle textStyle1 = TextStyle(
      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);

  TextStyle textStyle2 = TextStyle(color: Colors.black, fontSize: 15.0);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _loginContent(context),
      ),
    );
  }

  Widget _loginContent(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Hello there.', style: textStyle),
          Text(
            'Welcome Back!',
            style: textStyle,
          ),
          SizedBox(
            height: 80,
          ),
          _formFields(),
          _buttonLogin(context),
          SizedBox(height: 15),
          _otherComponent(context),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          _facebookLogin(context)
        ]),
      ),
    ]);
  }

  Widget _formFields() {
    return Column(
      children: [
        InputTextField(
          controller: emailController,
          onValidate: (value) {
            if (value.toString().isEmpty) {
              return 'Please enter email';
            }
          },
          hintText: 'Email',
          prefixIcon: Icon(
            Icons.email_outlined,
            size: 20,
          ),
          labelText: 'Email',
        ),
        SizedBox(
          height: 20.0,
        ),
        InputTextField(
            controller: passwordController,
            prefixIcon: Icon(Icons.lock_outline),
            hintText: "Password",
            labelText: "Password",
            onValidate: null)
      ],
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 25.0),
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFF3F51B5),
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0x55d3d3d3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 6))
            ],
          ),
          child: Center(
            child: Text(
              'Login',
              style: textStyle1,
            ),
          ),
        ),
        onTap: () {
          print('Login Button Clicked');
        },
      ),
    );
  }

  Widget _otherComponent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Text(
            "Forgot Password?",
            style: textStyle2,
          ),
          onTap: () {},
        ),
        SizedBox(width: 155.0),
        GestureDetector(
          child: Text(
            "Sign up",
            style: textStyle2,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
        )
      ],
    );
  }

  Widget _facebookLogin(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 25.0),
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF3F51B5)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0x55d3d3d3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 6))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Color(0xFF3F51B5),
                  size: 25.0,
                ),
              ),
              Text(
                'Continue with Facebook',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        onTap: () {
          print('Facebook Button Clicked');
        },
      ),
    );
  }
}
