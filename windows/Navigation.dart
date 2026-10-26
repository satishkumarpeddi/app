import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const CatGallery(),
        '/details': (context) => const CatDetails(),
      },
    );
  }
}

class CatGallery extends StatefulWidget {
  const CatGallery({super.key});

  @override
  State<CatGallery> createState() => _CatGalleryState();
}

// class CatDetails extends StatelessWidget {
//   const CatDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Cat Details')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.pets, size: 100, color: Colors.blue),
//             const SizedBox(height: 20),
//             const Text(
//               'Welcome to Cat Details!',
//               style: TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Go Back'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CatDetails extends StatelessWidget {
  const CatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Cat Details')),
      body: Center(
        child: Image.network(
          imageUrl,
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _CatGalleryState extends State<CatGallery> {
  int currentIndex = 0;
  List<String> list = [
    'http://localhost:3000/Leopardus-tilcayo-cat.png',
    'http://localhost:3000/cutcat.jpg',
    'http://localhost:3000/portriat.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.amber.shade100,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "Cat Gallery",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;

          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: isSmallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        list[currentIndex],
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = (currentIndex + 1) % list.length;
                          });
                        },
                        child: const Text('Next'),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        list[currentIndex],
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = (currentIndex + 1) % list.length;
                          });
                        },
                        child: const Text('Next'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const CatDetails(),
                          //   ),
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: list[currentIndex],
                          );
                        },
                        child: const Text('Open Cat Detials'),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
