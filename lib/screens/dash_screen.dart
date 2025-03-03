import 'package:flutter/material.dart';

class DashScreen extends StatelessWidget {
  static const String id = 'dash_screen';

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
        child: Center(
          child: Text(
            'Dash Screen',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
