import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return MaterialApp(
      home: Scaffold(
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: const Image(image: AssetImage('assets/images/image.png'))),
      ),
    );
  }
}
