import 'dart:html';

import 'package:flutter/material.dart';
import 'package:diploma/screens/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class reportPage extends StatefulWidget {
  const reportPage({Key? key}) : super(key: key);

  @override
  State<reportPage> createState() => _reportPageState();
}

class _reportPageState extends State<reportPage> {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorblue,
          title: Text(" ${loggedInUser.firstName}, ${loggedInUser.lastName}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          centerTitle: true,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Row(
                        children: [
                          Expanded(
                            /*1*/
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*2*/
                                Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: const Text(
                                    'Oeschinen Lake Campground',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Kandersteg, Switzerland',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /*3*/
                          Icon(
                            Icons.star,
                            color: Colors.red[500],
                          ),
                          const Text('41'),
                        ],
                      ),
                    )))
            //padding: const EdgeInsets.all(32),

            // child: Row(
            //   children: [
            //     Expanded(
            //       /*1*/
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           /*2*/
            //           Container(
            //             padding: const EdgeInsets.only(bottom: 8),
            //             child: const Text(
            //               'Oeschinen Lake Campground',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //           Text(
            //             'Kandersteg, Switzerland',
            //             style: TextStyle(
            //               color: Colors.grey[500],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     /*3*/
            //     Icon(
            //       Icons.star,
            //       color: Colors.red[500],
            //     ),
            //     const Text('41'),
            //   ],
            // ),
            ));
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
  );
}
