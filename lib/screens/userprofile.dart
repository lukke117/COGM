import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/model/user_model.dart';
import 'package:diploma/screens/loginscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    final firstname = loggedInUser.firstName;
    final lastname = loggedInUser.lastName;
    final email = loggedInUser.email;
    final admin = loggedInUser.admin;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorblue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 45),
                    Text(
                      "Name:$firstname $lastname",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Email:$email",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 35),
                    Text(
                      "Admin status:$admin",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
