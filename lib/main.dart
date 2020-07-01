import 'package:flutter/material.dart';
import 'package:typeit/chat.dart';
import 'package:typeit/login.dart';
import 'package:typeit/registration.dart';

import 'custom_button.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Typeit',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        CustomButton(
          text: 'Log in',
          callback: () {
            Navigator.of(context).pushNamed(Login.id);
            },
        ),
          CustomButton(
            text: 'Register',
            callback: () {
              Navigator.of(context).pushNamed(Registration.id);
              },
          ),
        ],
      ),
    );
  }
}
