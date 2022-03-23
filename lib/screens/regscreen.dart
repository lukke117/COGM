import 'package:flutter/material.dart';

const colorblue = const Color(0xFF012B81);

const colorred = const Color(0xFFBE0411);

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailNameEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field

    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        //validator: () {},
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //last name field

    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        //validator: () {},
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //password field

    final emailNameField = TextFormField(
        autofocus: false,
        controller: emailNameEditingController,
        keyboardType: TextInputType.emailAddress,
        //validator: () {},
        onSaved: (value) {
          emailNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,

        //validator: () {},
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //confirm password field

    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        //validator: () {},
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final signUpButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: colorblue,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text("SignUp",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ));

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colorblue),
            onPressed: () {
              //passing back
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 200,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 20),
                      firstNameField,
                      SizedBox(height: 20),
                      secondNameField,
                      SizedBox(height: 20),
                      emailNameField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 20),
                      confirmPasswordField,
                      SizedBox(height: 15),
                      signUpButton
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
