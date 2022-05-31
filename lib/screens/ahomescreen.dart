import 'package:diploma/screens/reportdetail.dart';
import 'package:diploma/screens/sentreplog.dart';
import 'package:diploma/screens/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/model/user_model.dart';
import 'package:diploma/screens/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  List reportDatas = [];

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
    getData();
  }

  Widget adminFeature() {
    if (loggedInUser.admin == true) {
      return const Text(
        "You are an admin",
        style: TextStyle(fontSize: 20),
      );
    } else {
      return Container();
    }
  }
  //  _collectionRef =
  //   FirebaseFirestore.instance.collection('users').doc();

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> getData() async {
    _collectionRef.get().then((snapshot) {
      snapshot.docs.forEach((element) {
        getReports(element.id.toString());
        print(element.id);
      });
    });
  }

  getReports(String element) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(element)
        .collection('Reports')
        .get()
        .then((docs) {
      if (docs.docs.isNotEmpty) {
        for (int i = 0; i < docs.docs.length; i++) {
          print("datyaaa ${docs.docs[i].data()}");
          setState(() {
            reportDatas.add(docs.docs[i].data());
          });
          print("reportData $reportDatas");
        }
      }
    });
  }

  Widget build(BuildContext context) {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
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
                SizedBox(
                  height: 200,
                  child: reportDatas.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Material(
                              elevation: 5,
                              // borderRadius: BorderRadius.circular(10),
                              // color: colorblue,
                              child: MaterialButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 25, 20, 25),
                                  minWidth: MediaQuery.of(context).size.width,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const reportdetails(),
                                            settings: RouteSettings(
                                                arguments:
                                                    reportDatas[index])));
                                    print(
                                      "reportDatas[index] ${reportDatas[index]} ${reportDatas[index].runtimeType}",
                                    );
                                    // Navigator.pushNamed(context, '/Products',
                                    //     arguments: {"id": 1, "name": "apple"});
                                  },
                                  child: Text(
                                    "${reportDatas[index]['name']} ${reportDatas[index]['lastName']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      // color: Colors.white,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  )),
                            );
                          },
                        )
                      : const Text('Lama'),
                ),
                ActionChip(
                    label: const Text("See All"),
                    onPressed: () {
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const sRepLog(),
                                settings:
                                    RouteSettings(arguments: reportDatas)));
                        // Navigator.pushNamed(context, '/Products',
                        //     arguments: {"id": 1, "name": "apple"});
                      }
                    }),
                ActionChip(
                    label: const Text("Logout"),
                    onPressed: () {
                      logout(context);
                    })
              ],
            ),
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
