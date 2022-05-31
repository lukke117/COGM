import 'ahomescreen.dart';
import 'package:flutter/material.dart';

class reportdetails extends StatefulWidget {
  const reportdetails({Key? key}) : super(key: key);

  @override
  State<reportdetails> createState() => _reportdetailsState();
}

class _reportdetailsState extends State<reportdetails> {
  // Map sdsd = {};

  // reportdetails({this.data})
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final dataR = Map<String, dynamic>.from(data);
    // sdsd = data;
    print("dataReport detail $data");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorblue,
        title: Text('${data["name"]} ${data["lastName"]}',
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
                    const Text("Minister's report",
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 45),
                    Text("Date: ${data["date"]}"),
                    const SizedBox(height: 20),
                    Text("Local Church: ${data["localChurch"]}"),
                    const SizedBox(height: 20),
                    Text("Address: ${data["address"]}"),
                    const SizedBox(height: 20),
                    const Text("Statistics", style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    Text("Frequency preaching/Leading worship:${data["fplw"]}"),
                    const SizedBox(height: 20),
                    Text("Soul Saved:${data["soulSaved"]}"),
                    const SizedBox(height: 20),
                    Text("Baptized by the holy spirit: ${data["bbhs"]}"),
                    const SizedBox(height: 20),
                    Text("Water baptism: ${data["wb"]}"),
                    const SizedBox(height: 20),
                    Text("Discipled: ${data["discipled"]}"),
                    const SizedBox(height: 20),
                    Text("Number of bible study/caregroups: ${data["nbscg"]}"),
                    const SizedBox(height: 20),
                    Text("Number of workers:${data["nofworkers"]}"),
                    const SizedBox(height: 20),
                    Text("Average attendance last month:${data["avgattlm"]}"),
                    const SizedBox(height: 20),
                    Text("Average attendance this month:${data["avgtttlm"]}"),
                    const SizedBox(height: 10),
                    Text("Men:${data["men"]}"),
                    const SizedBox(height: 10),
                    Text("Women:${data["women"]}"),
                    const SizedBox(height: 10),
                    Text("Youth:${data["youth"]}"),
                    const SizedBox(height: 10),
                    Text("Couples:${data["couples"]}"),
                    const SizedBox(height: 10),
                    Text("Children sunday school:${data["css"]}"),
                    const SizedBox(height: 10),
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
