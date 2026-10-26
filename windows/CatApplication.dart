import 'package:flutter/material.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});
  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int currentIndex = 0;
  final List<String> catImages = [
    'http://localhost:3000/Leopardus-tilcayo-cat.png',
    'https://images.unsplash.com/photo-1573865526739-10659fec78a5?w=700',
    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=600',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 167, 243),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 102, 172),
        foregroundColor: Colors.amberAccent,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "Cat Gallery",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: EdgeInsets.all(20),
          height: 500,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  catImages[currentIndex],
                  width: 300,
                  height: 300,
                ),
              ),
              const Text(
                "Meet your cats!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(
                  () => currentIndex = (currentIndex + 1) % catImages.length,
                ),
                child: const Text("Click Me!!!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
