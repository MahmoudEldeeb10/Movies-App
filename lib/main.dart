import 'package:flutter/material.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: Center(child: Text('Welcome to Movies App'))),
    );
  }
}
