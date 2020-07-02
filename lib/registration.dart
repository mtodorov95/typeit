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

  Future<void> registerUser()async{
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    FirebaseUser user = result.user;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(user: user,),
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
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: 'Enter your email...',
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: 'Enter your password...',
              border: const OutlineInputBorder(),
            ),
          ),
          CustomButton(
            text: 'Register',
            callback: () async {
              await registerUser();
            },
          ),
        ],
      ),
    );
  }
}
