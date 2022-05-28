import 'package:diploma/screens/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/model/user_model.dart';
import 'package:diploma/screens/loginscreen.dart';

const colorblue = Color(0xFF012B81);

const colorred = Color(0xFFBE0411);

class AHomeScreen extends StatefulWidget {
  const AHomeScreen({Key? key}) : super(key: key);

  @override
  State<AHomeScreen> createState() => _AHomeScreenState();
}

class _AHomeScreenState extends State<AHomeScreen> {
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

  Widget adminFeature() {
    if (loggedInUser.admin == true) {
      return const Text("You are an admin");
    } else {
      return Container();
    }
  }

  Widget build(BuildContext context) {
    final reportButton = Material(
      elevation: 5,
      //borderRadius: BorderRadius.circular(30),
      color: colorblue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //  Navigator.push(context,
            //      MaterialPageRoute(builder: (context) => const reportPage()));
          },
          child: const Text(
            "report",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final report1Button = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: colorblue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const reportPage()));
          },
          child: const Text(
            "##/##/##/report",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final report2Button = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: colorblue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //  Navigator.push(context,
            //  MaterialPageRoute(builder: (context) => const reportPage()));
          },
          child: const Text(
            "##/##/##/report",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorblue,
        title: Text("Welcome, ${loggedInUser.firstName}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.portrait,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              adminFeature(),
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Click the Button below to view the monthly reports",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              reportButton,
              const SizedBox(
                height: 20,
              ),
              report1Button,
              const SizedBox(height: 20),
              report2Button,
              const SizedBox(height: 20),
              ActionChip(
                  label: const Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// the logout function
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()));
}

//  Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => reportPage()));
