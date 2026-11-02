import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Application")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                title: "Home",
                icon: Icons.settings,
                color: Colors.blue.shade400,
                onPressed: () => print("Setting pressed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(title),
      icon: Icon(icon),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber.shade500,
        foregroundColor: Colors.blue.shade500,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      ),
    );
  }
}
