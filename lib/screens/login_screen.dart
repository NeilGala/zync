import 'package:flutter/material.dart';
import 'package:zync/components/rounded_button.dart';
import 'package:zync/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zync/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF2A2A2A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Email',
                  ),
                  style: TextStyle(
                    color: Colors.white, // Change this to your desired color
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password',
                  ),
                  style: TextStyle(
                    color: Colors.white, // Change this to your desired color
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  color: Color(0xFFD3D3D3),
                  title: 'Log In',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final User = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);
                      if (User != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
