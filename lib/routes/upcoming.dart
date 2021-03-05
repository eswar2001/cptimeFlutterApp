import 'package:cptime/compenents/ViewAllcontest.dart';
import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Text(
          'upcoming contests',
          style: GoogleFonts.roboto(),
        ),
      ),
      body: FutureBuilder(
        future: widget.futureContest,
        builder: (context, snapshot) {
          List<Contest> contest = snapshot.data;
          if (snapshot.data != null) {
            contest = contest.where((i) => i.when == "upcoming").toList();
            // contest.removeWhere((item) => item.when != "ongoing");
          }
          return snapshot.data != null
              ? ViewAllcontest(contest, "upcoming")
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
