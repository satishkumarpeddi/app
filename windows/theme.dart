import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  bool isDarkMode = false;

  void themeToggole(bool value) => {setState(() => isDarkMode = value)};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          title: const Text("Application"),
          actions: [Switch(value: isDarkMode, onChanged: themeToggole)],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode, size: 80),
              Text(isDarkMode ? "Dark Mode" : "LightMode"),

              ElevatedButton(
                onPressed: () => themeToggole(!isDarkMode),
                child: Text("Toggole"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
