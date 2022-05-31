import 'package:diploma/screens/ahomescreen.dart';
import 'package:diploma/screens/reportdetail.dart';
import 'package:flutter/material.dart';

class sRepLog extends StatefulWidget {
  const sRepLog({Key? key}) : super(key: key);

  @override
  State<sRepLog> createState() => _sRepLogState();
}

class _sRepLogState extends State<sRepLog> {
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorblue,
          title: const Text("Monthly Reports log",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          centerTitle: true,
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
                  SizedBox(
                    height: 300,
                    child: data.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.all(10),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Material(
                                elevation: 5,
                                // borderRadius: BorderRadius.circular(10),
                                // color: colorblue,
                                child: MaterialButton(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 25, 20, 25),
                                    minWidth: MediaQuery.of(context).size.width,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const reportdetails(),
                                              settings: RouteSettings(
                                                  arguments: data[index])));
                                    },
                                    child: Text(
                                      "$data[index]['name']} ${data[index]['lastName']}",
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
                        : const Text('pls wait'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
// class sRepLog extends StatefulWidget {
//   const sRepLog({Key? key}) : super(key: key);

//   @override
//   _sRepLogState createState() => _sRepLogState();
// }

// class _sRepLogState extends State<sRepLog> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }

// }
