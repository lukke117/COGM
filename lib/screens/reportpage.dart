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

final dateController = new TextEditingController();
final yearController = new TextEditingController();
final localChurchController = new TextEditingController();
final addressController = new TextEditingController();

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
    final dateField = TextFormField(
        autofocus: false,
        controller: dateController,
        obscureText: false,
        validator: (value) {
          if (value!.isEmpty) {
            return ("month is required");
          }
        },
        onSaved: (value) {
          dateController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_month),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "date",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final yearField = TextFormField(
        autofocus: false,
        controller: yearController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Year cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          yearController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Year",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final localChurchField = TextFormField(
        autofocus: false,
        controller: localChurchController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("localChurch cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          localChurchController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.church),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Local Church",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    final addressField = TextFormField(
        autofocus: false,
        controller: addressController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Address cannot be Empty");
          }

          return null;
        },
        onSaved: (value) {
          addressController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.location_city),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    final nextButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: colorblue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //  submit(dateController.text, localChurchController.text, addressController.text );
          },
          child: const Text(
            "Next",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
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
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 45),
                    dateField,
                    const SizedBox(height: 20),
                    localChurchField,
                    const SizedBox(height: 20),
                    addressField,
                    const SizedBox(height: 20),
                    nextButton
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
