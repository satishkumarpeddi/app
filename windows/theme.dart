import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Toggle'),
          actions: [Switch(value: isDarkMode, onChanged: toggleTheme)],
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode, size: 80),

              const SizedBox(height: 20),

              Text(
                isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: const TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  toggleTheme(!isDarkMode);
                },
                child: const Text('Toggle Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
