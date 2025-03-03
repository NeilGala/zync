import 'package:flutter/material.dart';
import 'package:zync/components/rounded_button.dart';
import 'package:zync/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zync/screens/chat_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:zync/screens/dash_screen.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

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
                controller: emailController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your Email',
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: passwordController,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your Password',
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                  textAlign: TextAlign.center,
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
                    errorMessage = '';
                  });
                  try {
                    final User = await _auth.signInWithEmailAndPassword(
                        email: email!, password: password!);
                    if (User != null) {
                      Navigator.pushNamed(context, DashScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                      errorMessage = 'Email or Password is incorrect,try again';
                      emailController.clear();
                      passwordController.clear();
                    });
                  }
                },
              ),
              if (showSpinner)
                Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      colors: [Colors.white],
                      strokeWidth: 2,
                    ),
                  ),
                ),
              //TODO: Add a forgot password button
            ],
          ),
        ),
      ),
    );
  }
}
