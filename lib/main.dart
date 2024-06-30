import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Vercel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginUserScreen(),
      routes: {
        '/login': (context) => LoginUserScreen(),
        '/register': (context) => RegisterUserScreen(),
      },
    );
  }
}
