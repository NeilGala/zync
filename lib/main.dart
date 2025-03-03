import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zync/screens/chat_screen.dart';
import 'package:zync/screens/dash_screen.dart';
import 'package:zync/screens/login_screen.dart';
import 'package:zync/screens/registration_screen.dart';
import 'package:zync/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO:initial Roue   :    FirebaseAuth.instance.currentUser == null ? WelcomeScreen.id : ChatScreen.id,
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DashScreen.id: (context) => DashScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
