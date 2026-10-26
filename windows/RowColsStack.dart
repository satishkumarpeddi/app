import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Row, Column and Stack')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // ROW LAYOUT
                const Text(
                  'ROW LAYOUT',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text(
                        'One',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: const Text(
                        'Two',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text(
                        'Three',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40), // COLUMN LAYOUT
                const Text(
                  'COLUMN LAYOUT',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Container(
                      width: 250,
                      height: 60,
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: const Text('Item 1'),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 250,
                      height: 60,
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: const Text('Item 2'),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 250,
                      height: 60,
                      color: Colors.purple,
                      alignment: Alignment.center,
                      child: const Text(
                        'Item 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // STACK LAYOUT
                const Text(
                  'STACK LAYOUT',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background layer
                      Container(width: 300, height: 200, color: Colors.blue),
                      // Middle layer
                      Container(width: 220, height: 140, color: Colors.orange),
                      // Top layer
                      const Text(
                        'Stack Widget',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
