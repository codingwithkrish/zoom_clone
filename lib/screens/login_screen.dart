import 'package:flutter/material.dart';
import 'package:zoom_clone/Widgets/custombutton.dart';
import 'package:zoom_clone/auth_method.dart';
import 'package:zoom_clone/screens/Home.dart';
import 'package:zoom_clone/utils/colors.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Start or Join a Meeting",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 38.0),
              child: Image.asset("assets/zoom.jpg")),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              bool res = await _authMethods.signinEmail(context);
              if (res) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }
            },
          )
        ],
      ),
    );
  }
}
