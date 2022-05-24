import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [],
      ),
    );
  }
}

// class User {
//   final String imagePath;
//   const User({required this.imagePath});  
// }

// class UserPreferences {
//   static const myUser = User(imagePath: '##');
// }
