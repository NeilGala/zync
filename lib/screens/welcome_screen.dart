import 'package:flutter/material.dart';
import 'package:zync/screens/login_screen.dart';
import 'package:zync/screens/registration_screen.dart';
import 'package:zync/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
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
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/logo.png',
                  height: 120.0,
                ),
              ),
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      '💬 Talk More  Scroll Less 💬',
                      textStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB2B2B2),
                        fontStyle: FontStyle.italic,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              RoundedButton(
                color: Color(0xFFD3D3D3),
                title: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    LoginScreen.id,
                  );
                },
              ),
              RoundedButton(
                color: Color(0xFFB2B2B2),
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RegistrationScreen.id,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
