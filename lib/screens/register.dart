import 'package:flutter/material.dart';
import 'package:jsend/api_request.dart';
import 'package:jsend/jsend.dart';
import 'package:onlinemarket/elements/inputComponents.dart';

class AccountRegister extends StatefulWidget {
  @override
  _AccountRegisterState createState() => _AccountRegisterState();
}

class _AccountRegisterState extends State<AccountRegister> {
  TextStyle textStyle = TextStyle(
      color: Color(0xFF3F51B5), fontSize: 32.0, fontWeight: FontWeight.bold);
  TextStyle textStyle1 = TextStyle(
      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);
  TextStyle textStyle2 = TextStyle(color: Colors.black, fontSize: 15.0);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  jsendResponse? lastResponse;

  void _register() async {
    var apiRequest = APIRequest(
        path: 'create-user',
        payload: {
          'name': fullNameController.text.trim(),
          'email': emailController.text.trim(),
          'pass': passwordController.text.trim(),
          'address': addressController.text.trim(),
          'phone': phoneController.text.trim()
        },
        method: 'POST');
    var httpResponse = await apiRequest.send();
    var jsonResp = jsendResponse(httpResponse);
    lastResponse = jsonResp;
    if (jsonResp.status == 200.toString()) {
      print('Account Created Successfully');
    } else if (jsonResp.status == 400.toString()) {
      print('Account Create Failed with validation errors');
      formKey.currentState!.validate();
      // print('Validation Errors: ' + jsonResp.data.toString());
    } else {
      print('Account didnot create');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _registerContent(context),
      ),
    );
  }

  Widget _registerContent(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Signup to', style: textStyle),
          Text(
            'Get started',
            style: textStyle,
          ),
          _formFields(),
          _buttonRegister(context),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 50.0),
            child: _otherRegisterComponent(context),
          ),
        ]),
      ),
    ]);
  }

  Widget _formFields() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        InputTextField(
          controller: fullNameController,
          hintText: 'Full Name',
          onValidate: (value) {
            if (value.toString().isEmpty) {
              return 'Please Enter Full Name';
            }
          },
          prefixIcon: Icon(
            Icons.account_box_outlined,
            size: 20,
          ),
          labelText: 'Full Name',
        ),
        InputTextField(
          hintText: 'Email',
          controller: emailController,
          onValidate: (value) {
            if (value.toString().isEmpty) {
              return 'Please enter email';
            }
          },
          prefixIcon: Icon(
            Icons.email_outlined,
            size: 20,
          ),
          labelText: 'Email',
        ),
        InputTextField(
          controller: phoneController,
          hintText: 'Phone Number',
          onValidate: (value) {
            if (value.toString().isEmpty) {
              return 'Please enter phone number';
            }
          },
          prefixIcon: Icon(
            Icons.phone_outlined,
            size: 20,
          ),
          labelText: 'Phone Number',
        ),
        InputTextField(
            controller: passwordController,
            prefixIcon: Icon(Icons.lock_outline),
            hintText: "Password",
            labelText: "Password",
            onValidate: (value) {
              if (value.toString().trim().isEmpty) {
                return 'Please enter password';
              }
            }),
        InputTextField(
          controller: addressController,
          onValidate: (value) {
            if (value.toString().isEmpty) {
              return 'Please enter address';
            }
          },
          hintText: 'Address',
          prefixIcon: Icon(
            Icons.location_on_outlined,
            size: 20,
          ),
          labelText: 'Address',
        )
      ],
    );
  }

  Widget _buttonRegister(BuildContext context) {
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
              'Signup',
              style: textStyle1,
            ),
          ),
        ),
        onTap: () {
          _register();
        },
      ),
    );
  }

  Widget _otherRegisterComponent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Text(
            "Already have an Account? Login",
            style: textStyle2,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
