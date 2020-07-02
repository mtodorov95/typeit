import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat.dart';
import 'custom_button.dart';

class Login extends StatefulWidget {
  static const String id = "LOGIN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser()async{
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    FirebaseUser user = result.user;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(user: user),
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
            text: 'Login',
            callback: () async {
              await loginUser();
            },
          ),
        ],
      ),
    );
  }
}
