import 'package:flutter/material.dart';

void main() {
  runApp(MyZaarvisApp());
}

class MyZaarvisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zaarvis AI',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zaarvis AI'),
      ),
      body: Center(
        child: Text(
          'Welcome to your Zaarvis!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
