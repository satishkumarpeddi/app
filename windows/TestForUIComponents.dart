import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  runApp(const MyApp());
}

// MAIN APPLICATION

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

// COUNTER SCREEN

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value:'),

            Text(
              '$counter',
              key: const Key('counterValue'),
              style: const TextStyle(fontSize: 30),
            ),

            ElevatedButton(
              key: const Key('incrementButton'),
              onPressed: incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

// WIDGET TESTS

void counterTests() {
  testWidgets('Counter displays initial value', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Counter increments when button is pressed', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('incrementButton')));

    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('UI elements are displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Counter App'), findsOneWidget);
    expect(find.text('Counter Value:'), findsOneWidget);
    expect(find.text('Increment'), findsOneWidget);
  });
}
