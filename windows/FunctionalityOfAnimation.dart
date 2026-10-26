import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  bool _visible = false;
  bool _sliding = false;
  bool _rotating = false;
  bool _scaling = true;

  @override
  void initState() {
    super.initState();

    // Fade animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_fadeController);

    // Slide animation
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(_slideController);

    // Rotation animation
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_rotateController);

    // Scale animation
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _scaleController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Demo')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: RotationTransition(
                    turns: _rotateAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: const FlutterLogo(size: 100),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              SwitchListTile(
                title: const Text('Fade'),
                value: _visible,
                onChanged: (bool value) {
                  setState(() {
                    _visible = value;
                  });

                  value ? _fadeController.reverse() : _fadeController.forward();
                },
              ),

              SwitchListTile(
                title: const Text('Slide'),
                value: _sliding,
                onChanged: (bool value) {
                  setState(() {
                    _sliding = value;
                  });

                  if (value) {
                    _slideController.repeat(reverse: true);
                  } else {
                    _slideController.stop();
                  }
                },
              ),

              SwitchListTile(
                title: const Text('Rotate'),
                value: _rotating,
                onChanged: (bool value) {
                  setState(() {
                    _rotating = value;
                  });

                  if (value) {
                    _rotateController.repeat();
                  } else {
                    _rotateController.stop();
                  }
                },
              ),

              SwitchListTile(
                title: const Text('Scale'),
                value: _scaling,
                onChanged: (bool value) {
                  setState(() {
                    _scaling = value;
                  });

                  if (value) {
                    _scaleController.repeat(reverse: true);
                  } else {
                    _scaleController.stop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
