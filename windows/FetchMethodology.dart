import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> fetchMethod() async {
  // try {
  //   final response = await http.get(Uri.parse('http://localhost:3001/todos'));
  //   print('Status Code : ${response.statusCode}');
  //   print('Response Body: ${response.statusCode}');

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     // print('Parsed Data: ');
  //     // print(data);
  //     for (final todo in data) print('${todo}');
  //   }
  // } catch (error) {
  //   print('Error fetching data: $error');
  // }

  try {
    final url = Uri.parse('http://localhost:3001/todos');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': "Learing Flutter Post",
        'description': "I want to master flutter post methodology",
      }),
    );
    print('Status Code : ${response.statusCode}');
    print('Response body : ${response.body}');
  } catch (error) {
    throw error;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  fetchMethod();

  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Check the terminal for API response')),
      ),
    ),
  );
}
