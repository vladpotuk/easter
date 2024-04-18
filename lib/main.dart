import 'package:flutter/material.dart';

void main() {
  runApp(EasterApp());
}


class EasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easter',
      theme: ThemeData(
        primaryColor: Colors.lightGreen[600],
        hintColor: Colors.orangeAccent,
        scaffoldBackgroundColor: Colors.yellow[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            color: Colors.black87,
          ),
        ),
      ),
      home: EasterHomePage(),
    );
  }
}

class EasterHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Easter',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedEasterEgg(),
            SizedBox(height: 20),
            Text(
              'Happy Easter!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedEasterEgg extends StatefulWidget {
  @override
  _AnimatedEasterEggState createState() => _AnimatedEasterEggState();
}

class _AnimatedEasterEggState extends State<AnimatedEasterEgg> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14, // full rotation
          child: Image.asset(
            'assets/easter_egg.png',
            width: 150,
            height: 200,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
