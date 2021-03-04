import 'package:cptime/compenents/platform.dart';
import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';

class Codechef extends StatefulWidget {
  Future<List<Contest>> futureContest;
  Codechef(this.futureContest);

  @override
  _CodechefState createState() => _CodechefState();
}

class _CodechefState extends State<Codechef> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: FutureBuilder(
        future: widget.futureContest,
        builder: (context, snapshot) {
          // print(snapshot);
          return snapshot.data != null
              ? ViewBycontest(snapshot.data, "codechef")
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
