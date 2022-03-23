import 'package:diploma/screens/loginscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COG reports',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginScreen(),
    );
  }
}
