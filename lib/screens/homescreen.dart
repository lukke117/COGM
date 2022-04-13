import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/model/user_model.dart';
import 'package:diploma/ws/square.dart';

const colorblue = Color(0xFF012B81);

const colorred = Color(0xFFBE0411);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _reports = [
    'report 1',
    'report 2',
    'report 3',
    'report 4',
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 60,
                  child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: _reports.length,
            itemBuilder: (context, index) {
              return MySquare(
                child: _reports[index],
              );
            })
        // body: Center(
        //     child: Padding(
        //         padding: const EdgeInsets.all(20),
        //         child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: <Widget>[
        //               ListView.builder(
        //                   itemCount: _reports.length,
        //                   itemBuilder: (context, int index) {
        //                     return MySquare(
        //                       child: _reports[index],
        //                     );
        //                   })
        //             ]
        //   SizedBox(
        //     height: 150,
        //     child: Image.asset("assets/logo.png", fit: BoxFit.contain),
        //   ),
        //   const Text(
        //     "Welcome Back!",
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //   ),
        //   const SizedBox(height: 20),
        //   const Text("Name",
        //       style: TextStyle(
        //         color: Colors.black54,
        //         fontWeight: FontWeight.w500,
        //       )),
        //   Text("${loggedInUser.firstName}",
        //       style: const TextStyle(
        //         color: Colors.black54,
        //         fontWeight: FontWeight.w500,
        //       )),
        //   const Text("Email",
        //       style: TextStyle(
        //         color: Colors.black54,
        //         fontWeight: FontWeight.w500,
        //       )),
        //   Text("${loggedInUser.email}",
        //       style: const TextStyle(
        //         color: Colors.black54,
        //         fontWeight: FontWeight.w500,
        //       )),
        //   const SizedBox(
        //     height: 15,
        //   ),
        //   ActionChip(
        //       label: const Text("Logout"),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       }),
        // ],
        );
  }
}
