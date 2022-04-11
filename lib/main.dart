import 'package:diploma/screens/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAP34vZvWVbZLd30ndkDWXXqDOehjx66PQ", // Your apiKey
      appId: "1:936957627271:android:d5d2ef61cfcecbe0a3e122", // Your appId
      messagingSenderId: "936957627271", // Your messagingSenderId
      projectId: "cogm-e4ca1", // Your projectId
    ),
  );

  runApp(const MyApp());
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
      home: const LoginScreen(),
    );
  }
}
