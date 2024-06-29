import 'dart:convert';
import 'package:http/http.dart' as http;

// Function to register a new user
Future<void> registerUser(String email, String password) async {
  var url = Uri.https('your-vercel-app-url', '/api/register'); // Replace with your Vercel deployment URL and API endpoint
  try {
    var response = await http.post(
      url,
      body: jsonEncode({'email': email, 'password': password}), // Encode data as JSON
      headers: {'Content-Type': 'application/json'}, // Set headers
    );
    if (response.statusCode == 200) {
      // Registration successful
      print('Registration successful');
    } else {
      // Handle registration error
      print('Failed to register: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or server error
    print('Error during registration: $e');
  }
}

// Function to authenticate a user
Future<void> loginUser(String email, String password) async {
  var url = Uri.https('your-vercel-app-url', '/api/login'); // Replace with your Vercel deployment URL and API endpoint
  try {
    var response = await http.post(
      url,
      body: jsonEncode({'email': email, 'password': password}), // Encode data as JSON
      headers: {'Content-Type': 'application/json'}, // Set headers
    );
    if (response.statusCode == 200) {
      // Login successful
      print('Login successful');
    } else {
      // Handle login error
      print('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or server error
    print('Error during login: $e');
  }
}
