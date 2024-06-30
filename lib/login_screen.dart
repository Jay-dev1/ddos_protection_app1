import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginUserScreen extends StatefulWidget {
  @override
  _LoginUserScreenState createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginUser() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    
    final response = await http.post(
      Uri.parse('https://your-vercel-app.vercel.app/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String token = data['token'];
      // User logged in successfully
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User logged in successfully!')));
      // Save token and proceed to next screen
    } else {
      // Error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to login user: ${response.body}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login User')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _loginUser, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
