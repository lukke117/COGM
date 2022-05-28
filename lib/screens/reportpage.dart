// import 'package:diploma/model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:diploma/screens/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class reportPage extends StatefulWidget {
  const reportPage({Key? key}) : super(key: key);

  @override
  State<reportPage> createState() => _reportPageState();
}

final dateController = new TextEditingController();
final localChurchController = new TextEditingController();
final addressController = new TextEditingController();
final fplwController =
    new TextEditingController(); //frequency preaching / leading worship
final soulSavedController = new TextEditingController();
final bbhsController =
    new TextEditingController(); //baptised by the holy spirit
final wbController = new TextEditingController(); //water baptised
final discipledController = new TextEditingController();
final nbscgController =
    new TextEditingController(); //number of bible study/caregroup
final nofworkersController = new TextEditingController(); //number of workers
final avgattlmController =
    new TextEditingController(); //average attendance last month
final avgatttmController =
    new TextEditingController(); //avg attendance this month
final menController = new TextEditingController();
final womenController = new TextEditingController();
final youthController = new TextEditingController();
final couplesController = new TextEditingController();
final cssController = new TextEditingController(); //children sunday school

final cssField = TextFormField(
    autofocus: false,
    controller: cssController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("children sunday school cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      cssController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.child_care),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Children Sunday School",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final couplesField = TextFormField(
    autofocus: false,
    controller: couplesController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("Couples cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      couplesController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.portrait),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Couples",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final youthField = TextFormField(
    autofocus: false,
    controller: youthController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("youth cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      youthController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.child_care_outlined),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Youth",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final womenField = TextFormField(
    autofocus: false,
    controller: womenController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("women cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      womenController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.woman),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Women",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));
final menField = TextFormField(
    autofocus: false,
    controller: menController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("men cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      menController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.man),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Men",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final avgatttmField = TextFormField(
    autofocus: false,
    controller: avgatttmController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("average attendance this month cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      avgatttmController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.portrait_rounded),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Average attendance this month",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final avgattlmField = TextFormField(
    autofocus: false,
    controller: avgattlmController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("average attendance last month cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      avgattlmController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.portrait_rounded),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Average attendance last month",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));
final nofworkersField = TextFormField(
    autofocus: false,
    controller: nofworkersController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("number of workers cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      nofworkersController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.portrait_outlined),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "number of workers",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final nbscgField = TextFormField(
    autofocus: false,
    controller: nbscgController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("number of bible study/caregroup cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      nbscgController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.group),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "number of bible study/caregroup",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final discipledField = TextFormField(
    autofocus: false,
    controller: discipledController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("discipled field cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      discipledController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.people),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "discipled",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

final wbField = TextFormField(
    autofocus: false,
    controller: wbController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("water baptised cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      wbController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.water),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Water baptised",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));
final bbhsField = TextFormField(
    autofocus: false,
    controller: bbhsController,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("Baptised by the holy spirit cannot be Empty");
      }
      return null;
    },
    onSaved: (value) {
      bbhsController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.church),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Baptised by the holy spirit",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));

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
    Future<bool> submit() async {
      try {
        String? uid = FirebaseAuth.instance.currentUser?.uid;

        DocumentReference documentReference = FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('Reports')
            .doc(uid);
        Fluttertoast.showToast(msg: "Report submitted successfully ");

        Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
        FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentSnapshot snapshot = await transaction.get(documentReference);
          if (!snapshot.exists) {
            documentReference.set({
              'date': dateController.text,
              'localChurch': localChurchController.text,
              'address': addressController.text,
              'fplw': fplwController.text,
              'soulSaved': soulSavedController.text,
              'bbhs': bbhsController.text,
              'wb': wbController.text,
              'discipled': discipledController.text,
              'nbscg': nbscgController.text,
              'nofworkers': nofworkersController.text,
              'avgattlm': avgattlmController.text,
              'avgtttlm': avgatttmController.text,
              'men': menController.text,
              'women': womenController.text,
              'youth': youthController.text,
              'couples': couplesController.text,
              'css': cssController.text
            });
            return true;
          }
          return true;
        });
        return true;
      } catch (e) {
        return false;
      }
    }

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
    final fplwField = TextFormField(
        autofocus: false,
        controller: fplwController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Frequency of Preaching/Leading worship cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          fplwController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mic),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Frequency of Preaching/Leading worship",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final soulSavedField = TextFormField(
        autofocus: false,
        controller: soulSavedController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("souls saved cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          soulSavedController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.people_alt),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "souls saved",
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

    final submitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: colorblue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            await submit();
          },
          child: const Text(
            "Submit",
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
                    Text("Minister's report", style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 45),
                    dateField,
                    const SizedBox(height: 20),
                    localChurchField,
                    const SizedBox(height: 20),
                    addressField,
                    const SizedBox(height: 20),
                    Text("Statistics", style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    fplwField,
                    const SizedBox(height: 20),
                    soulSavedField,
                    const SizedBox(height: 20),
                    bbhsField,
                    const SizedBox(height: 20),
                    wbField,
                    const SizedBox(height: 20),
                    discipledField,
                    const SizedBox(height: 20),
                    nbscgField,
                    const SizedBox(height: 20),
                    nofworkersField,
                    const SizedBox(height: 20),
                    avgattlmField,
                    const SizedBox(height: 20),
                    avgatttmField,
                    const SizedBox(height: 10),
                    menField,
                    const SizedBox(height: 10),
                    womenField,
                    const SizedBox(height: 10),
                    youthField,
                    const SizedBox(height: 10),
                    couplesField,
                    const SizedBox(height: 10),
                    cssField,
                    const SizedBox(height: 10),
                    submitButton
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
