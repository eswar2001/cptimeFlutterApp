import 'package:cptime/compenents/ViewAllcontest.dart';
import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  Future<List<Contest>> futureContest;
  Upcoming(this.futureContest);

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upcoming contests'),
      ),
      body: FutureBuilder(
        future: widget.futureContest,
        builder: (context, snapshot) {
          // print(snapshot);
          return snapshot.data != null
              ? ViewAllcontest(snapshot.data, "upcoming")
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
