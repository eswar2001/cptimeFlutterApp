import 'package:cptime/compenents/ViewAllcontest.dart';
import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';

class Ongoing extends StatefulWidget {
  Future<List<Contest>> futureContest;
  Ongoing(this.futureContest);

  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ongoing contests"),
      ),
      body: FutureBuilder(
        future: widget.futureContest,
        builder: (context, snapshot) {
          // print(snapshot);
          return snapshot.data != null
              ? ViewAllcontest(snapshot.data, "ongoing")
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
