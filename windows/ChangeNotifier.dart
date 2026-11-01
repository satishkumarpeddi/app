import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. ChangeNotifier Provider Class
class CatProvider extends ChangeNotifier {
  int currentIndex = 0;

  final List<String> catImages = [
    'https://images.unsplash.com/photo-1573865526739-10659fec78a5?w=700',
    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=600',
  ];

  // Change to next cat
  void nextCat() {
    currentIndex = (currentIndex + 1) % catImages.length;
    notifyListeners();
  }
}

// 2. Main Function
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CatProvider(),
      child: const MyApp(),
    ),
  );
}

// 3. Main Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GalleryScreen(),
    );
  }
}

// 4. Gallery Screen
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 167, 243),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 102, 172),
        foregroundColor: Colors.amberAccent,
        title: const Text(
          "Cat Gallery",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Container(
          width: 500,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Consumer<CatProvider>(
            builder: (context, catProvider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display Cat Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      catProvider.catImages[catProvider.currentIndex],
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Meet your cats!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),

                  const SizedBox(height: 20),

                  // Next Cat Button
                  ElevatedButton(
                    onPressed: () {
                      catProvider.nextCat();
                    },
                    child: const Text("Click Me!!!"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
