import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homepage.dart';
import 'login.dart';
import 'signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDGKR4QpjJLWwRY_1rfzmkpy4BRv9a21IM",
          appId: "com.example.flutter_application_1",
          messagingSenderId: "messagingSenderId",
          projectId: "project1-4a575"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
