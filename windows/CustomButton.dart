import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Button Demo'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Home',
                icon: Icons.home,
                color: Colors.blue,
                onPressed: () {
                  print('Home button clicked');
                },
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: 'Settings',
                icon: Icons.settings,
                color: Colors.green,
                onPressed: () {
                  print('Settings button clicked');
                },
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: 'Delete',
                icon: Icons.delete,
                color: Colors.red,
                onPressed: () {
                  print('Delete button clicked');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable custom widget
class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    );
  }
}
