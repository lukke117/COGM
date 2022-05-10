import 'package:diploma/screens/homescreen.dart';
import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  // const MySquare({Key? key}) : super(key: key);

  final String child;
  MySquare({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                bottomLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0)),
            color: colorred,
          ),
          child: Center(
            child: TextButton(
              child: Text(
                child,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {},
            ),
            // child: Text(
            //   child,
            //   style: const TextStyle(fontSize: 40),
            // ),
          ),
        ));
  }
}
