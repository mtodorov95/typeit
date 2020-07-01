import 'package:flutter/material.dart';
import 'package:typeit/chat.dart';
import 'package:typeit/login.dart';
import 'package:typeit/registration.dart';

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


class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Colors.blueGrey,
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200,
          height: 45,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
