import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:typeit/custom_button.dart';

import 'chat.dart';

class Registration extends StatefulWidget {
  static const String id = "REGISTRATION";


  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registeruser()async{
    AuthResult user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Typeit'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(

          ),
          SizedBox(
            height: 40,
          ),
          TextField(

          ),
          CustomButton(
            text: 'Register',
            callback: () async {
              await registeruser();
            },
          ),
        ],
      ),
    );
  }
}
