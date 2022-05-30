import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ahomescreen.dart';
import 'package:flutter/material.dart';


class reportdetails extends StatefulWidget {
  const reportdetails({Key? key}) : super(key: key);

  @override
  State<reportdetails> createState() => _reportdetailsState();
}

class _reportdetailsState extends State<reportdetails> {

  

  // reportdetails({this.data})
  @override

  Widget build(BuildContext context) {
  final todo = ModalRoute.of(context)!.settings.arguments;

    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.


    return Scaffold(
      appBar: AppBar(
        title: Text("d"),
      ),
      body: Center(
        child: Text('name'),
      ),
    );
  }
}